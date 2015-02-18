class User < ActiveRecord::Base
    include DeviseTokenAuth::Concerns::User

    has_many :addresses
    has_one :wallet
    belongs_to :role
    has_many :shops, foreign_key: 'owner_id'

    has_many :basket_payed, class: Basket, foreign_key: 'buyer_id'
    has_many :check_out_basket, class: Basket, foreign_key: 'vendor_id'

    scope :wristbands, ->(user_id) { Wristband.joins(wallet: [:user]).where(users: {id: user_id }) }

    before_create :skip_confirmation!
    after_create :add_default_role, :add_wallet

    def pin_code_is?(pin_code)
      self.pin_code == pin_code
    end

    def wristbands
      Wristband.joins(wallet: [:user]).where(users: {id: self.id })
    end

    private

    def add_default_role
      self.role = Role.find_or_create_by(name: 'default')
      save!
    end

    def add_wallet
      @wallet = Wallet.create(user_id: id)
    end
end
