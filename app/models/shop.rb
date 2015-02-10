class Shop < ActiveRecord::Base
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }

  validate :owner_existence, on: [:create]

  include Status
  
  belongs_to :event
  belongs_to :user

  has_many :products
  has_many :baskets

  default_scope { where('status != ?', Shop.statuses[:deleted]) }

  private

  def owner_existence
    if self.owner_id.nil?
      errors.add(:owner_id, "is not defined.")
      return
    end
    @owner = User.find_by_id(self.owner_id)

    if @owner.nil?
      errors.add(:owner_id, "doesn't exists.")
    end
  end
end
