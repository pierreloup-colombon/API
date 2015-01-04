class AddOwnerToShops < ActiveRecord::Migration
  def change
    add_reference :shops, :owner, index: true
  end
end
