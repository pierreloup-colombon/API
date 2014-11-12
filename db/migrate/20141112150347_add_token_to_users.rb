class AddTokenToUsers < ActiveRecord::Migration
    def change
        add_column :users, :token, :string, null: false, default: ""

        add_index :users, :token, unique: true
    end
end
