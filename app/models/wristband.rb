class Wristband < ActiveRecord::Base
    belongs_to :user

    enum money_source: [:wrisband_only, :wallet_only, :credit_card]
    enum status: [:enabled, :disabled]
    enum currency: [:euro]

    #            _ _ _                _
    #   ___ __ _| | | |__   __ _  ___| | _____
    #  / __/ _` | | | '_ \ / _` |/ __| |/ / __|
    # | (_| (_| | | | |_) | (_| | (__|   <\__ \
    #  \___\__,_|_|_|_.__/ \__,_|\___|_|\_\___/

    before_create :set_unique_token
    
    private

    def set_unique_token
        begin
            self.token = SecureRandom.hex(12)
        end while self.class.exists?(token: token)
    end
end
