class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many :bookings, through: :tickets, dependent: :destroy

  after_update :send_notification_email

  def send_notification_email
    customer_ids = event.bookings.map(&:user_id).uniq
    EventUpdateNotificationJob.perform_async(id, customer_ids)
  end
end
