class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users) do |t|
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.json :tokens
      t.timestamps
    end
  end
end
