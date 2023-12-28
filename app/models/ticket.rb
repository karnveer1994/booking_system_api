class Ticket < ApplicationRecord
  has_many :bookings
  belongs_to :event
end
