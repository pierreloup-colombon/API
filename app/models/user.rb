class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    before_create :set_unique_token

    private

    def set_unique_token
        begin
            self.token = SecureRandom.hex(12)
        end while self.class.exists?(token: token)
    end

end
