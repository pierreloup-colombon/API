class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.references :user, index: true
      t.float :amount, default: 0.00
      t.timestamps
    end
  end
end
