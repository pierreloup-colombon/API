class Product < ActiveRecord::Base
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }
  validates :price,       numericality: { greater_than: 0.0 }

  validate :shop_existence, on: [:create]

  include Status

  belongs_to :shop

  private

  def shop_existence
    if self.shop_id.nil?
      errors.add(:shop_id, "is not defined.")
      return
    end

    @shop = Shop.find_by_id(self.shop_id)

    if @shop.nil?
      errors.add(:shop_id, "doesn't exists.")
    end
  end
end
