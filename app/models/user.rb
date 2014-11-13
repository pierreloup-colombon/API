class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable

    has_many :addresses
    has_many :wristbands

    #            _ _ _                _
    #   ___ __ _| | | |__   __ _  ___| | _____
    #  / __/ _` | | | '_ \ / _` |/ __| |/ / __|
    # | (_| (_| | | | |_) | (_| | (__|   <\__ \
    #  \___\__,_|_|_|_.__/ \__,_|\___|_|\_\___/

    before_create :set_unique_token

    def pin_code_is?(pin_code)
        self.pin_code == pin_code
    end

    private

    def set_unique_token
        begin
            self.token = SecureRandom.hex(12)
        end while self.class.exists?(token: token)
    end

end
