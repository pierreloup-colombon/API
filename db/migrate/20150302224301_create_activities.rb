class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :registrable

      t.timestamps
    end
  end
end
