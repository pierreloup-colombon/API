class CreateWristbands < ActiveRecord::Migration
  def change
      create_table :wristbands do |t|
          t.integer :money_source, default: 0
          t.integer :status, default: 0
          t.string :serial_number, default: ''
          t.integer :amount, default: 0
          t.integer :currency, default: 0
          t.references :wallet, index: true
          t.timestamps
      end
  end
end
