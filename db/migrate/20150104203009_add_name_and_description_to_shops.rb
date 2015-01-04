class AddNameAndDescriptionToShops < ActiveRecord::Migration
  def change
    add_column :shops, :name, :string
    add_column :shops, :description, :text
  end
end
