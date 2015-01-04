class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :description, :text
    add_column :products, :price, :float, default: 0.0
    add_column :products, :quantity, :integer, default: 0
  end
end
