class RenamePincodeFieldOnUsers < ActiveRecord::Migration
    def change
        rename_column :users, :pincode, :pin_code
    end
end
