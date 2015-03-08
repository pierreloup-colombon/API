class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :currency
      t.integer :places
      t.integer :activitie_id

      t.timestamps
    end
  end
end
