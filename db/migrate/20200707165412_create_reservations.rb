class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :number_of_guests
      t.string :reservation_start_date
      t.string :reservation_end_date
      t.integer :guest_id
      t.integer :house_id

      t.timestamps
    end
  end
end
