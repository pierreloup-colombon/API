class ShopBelongsToEvent < ActiveRecord::Migration
  def change
    add_belongs_to :shops, :event
  end
end
