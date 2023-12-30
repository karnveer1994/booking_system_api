class Ticket < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :event
end
