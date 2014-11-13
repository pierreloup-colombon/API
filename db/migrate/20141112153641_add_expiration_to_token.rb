class AddExpirationToToken < ActiveRecord::Migration
     def change
        add_column :users, :token_expiration, :date
    end
end
