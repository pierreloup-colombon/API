class CreateWristbands < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :wristbands, id: :uuid do |t|
        t.integer :money_source, default: 0
        t.integer :status, default: 0
        t.integer :amount, default: 0
        t.integer :currency, default: 0
        t.references :wallet, index: true
        t.timestamps
    end
  end
end
