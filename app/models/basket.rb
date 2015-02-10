class Basket < ActiveRecord::Base
  store :products, accessors: [:product_ids]

  enum status: [:activated, :payed, :pending]

  before_save :init_product_ids, on: [:create]

  belongs_to :buyer, class: User, foreign_key: 'buyer_id'
  belongs_to :vendor, class: User, foreign_key: 'vendor_id'
  belongs_to :shop

  private

  def init_product_ids
    self.product_ids = []
  end
end
