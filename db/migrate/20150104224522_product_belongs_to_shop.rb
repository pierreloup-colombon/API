class ProductBelongsToShop < ActiveRecord::Migration
  def change
    add_belongs_to :products, :shop
  end
end
