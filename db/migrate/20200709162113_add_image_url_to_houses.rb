class AddImageUrlToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :img_url, :string
  end
end
