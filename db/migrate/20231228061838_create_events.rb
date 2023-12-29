class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.time :event_time
      t.string :venue
      t.integer :user_id
      t.timestamps
    end
  end
end
