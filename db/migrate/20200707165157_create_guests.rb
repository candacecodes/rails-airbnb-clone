class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email_address
      t.string :address

      t.timestamps
    end
  end
end
