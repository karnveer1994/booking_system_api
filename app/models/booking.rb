class Booking < ApplicationRecord
  belongs_to :ticket
  belongs_to :event, through: :ticket
  belongs_to :customer
end
