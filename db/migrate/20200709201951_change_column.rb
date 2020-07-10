class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :reservation_start_date, :date
    change_column :reservations, :reservation_end_date, :date
  end
end
