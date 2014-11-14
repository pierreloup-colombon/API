class CreateWristbands < ActiveRecord::Migration
  def change
      create_table :wristbands do |t|
          t.string :token, null: false, default: ""
          t.integer :money_source, default: Wristband.money_sources[:wristband_only]
          t.integer :status, default: Wristband.statuses[:enabled]
          t.string :serial_number, default: ""
          t.integer :amount, default: 0
          t.integer :currency, default: Wristband.currencies[:euro]
          t.belongs_to :user
          t.timestamps
      end

      add_index :wristbands, :token, unique: true
  end
end
