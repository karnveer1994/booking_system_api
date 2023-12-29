class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :price
      t.string :ticket_type
      t.boolean :availability
      t.timestamps
    end
  end
end
