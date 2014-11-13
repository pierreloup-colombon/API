class AddFieldToUsers < ActiveRecord::Migration
    def change
        add_column :users, :firstname, :string
        add_column :users, :lastname,  :string
        add_column :users, :gender, :integer
        add_column :users, :birtdate, :date
        add_column :users, :phone, :integer
        add_column :users, :pincode, :integer
    end
end
