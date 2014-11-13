class Wristband < ActiveRecord::Base
    enum money_source: [:wrisband_only, :wallet_only, :credit_card]
    enum status: [:enabled, :disabled]
    enum currency: [:euro]
end
