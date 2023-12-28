class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :ticket_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
