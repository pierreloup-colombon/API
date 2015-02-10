class AddFieldToBasket < ActiveRecord::Migration
  def change
    change_table :baskets do |t|
      t.integer :status, default: 0
      t.references :shop
      t.references :user
      t.references :wristbrand
      t.text :products
    end
  end
end
