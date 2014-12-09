class User < ActiveRecord::Base
    include DeviseTokenAuth::Concerns::User

    has_many :addresses
    has_many :wristbands

    before_create :skip_confirmation!

    def pin_code_is?(pin_code)
        self.pin_code == pin_code
    end
end
