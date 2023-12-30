class Booking < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  before_create :update_total_price

  after_create :send_confirmation_email

  def send_confirmation_email
    TicketBookingConfirmationJob.perform_async(id)
  end

  def update_total_price
    self.total_price = (ticket.price * quantity)
  end
end
