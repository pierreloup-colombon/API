class Basket < ActiveRecord::Base
  store :products, accessors: [:product_ids]

  enum status: [:activated, :payed, :pending]

  before_save :init_product_ids, on: [:create]

  private

  def init_product_ids
    self.product_ids = []
  end
end
