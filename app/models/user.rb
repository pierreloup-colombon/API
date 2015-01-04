class User < ActiveRecord::Base
    include DeviseTokenAuth::Concerns::User

    has_many :addresses
    has_many :wristbands
    belongs_to :role
    has_many :shops, foreign_key: 'owner_id'

    before_create :skip_confirmation!
    after_create :add_default_role

    def pin_code_is?(pin_code)
        self.pin_code == pin_code
    end

    private

    def add_default_role
        self.role = Role.find_or_create_by(name: 'default')
        save!
    end
end
