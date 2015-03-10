Plass AddFieldToBasket < ActiveRecord::Migration
  def change
    change_table :baskets do |t|
      t.integer :status, default: 0
      t.references :shop, index: true
      t.integer :vendor_id, null: false
      t.integer :buyer_id, default: nil
      t.float :total, default: 0
      t.text :products
    end
  end
end
