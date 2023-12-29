class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User

  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
