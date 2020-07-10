class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.integer :guest_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
