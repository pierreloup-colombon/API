class CreateAddresses < ActiveRecord::Migration
    def change
        create_table :addresses do |t|
            t.string :street
            t.string :zip, :string
            t.string :city, :string
            t.string :country, :string
            t.timestamps

            t.belongs_to :user
        end
    end
end
