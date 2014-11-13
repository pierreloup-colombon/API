class AddExpirationToToken < ActiveRecord::Migration
     def change
        add_column :tokens, :token_expiration, :date
    end
end
