class Shop < ActiveRecord::Base
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }

  belongs_to :event
end
