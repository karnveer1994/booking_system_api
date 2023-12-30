class AddTotalPriceAndQuantity < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :total_price, :integer
    add_column :bookings, :quantity, :integer
  end
end
