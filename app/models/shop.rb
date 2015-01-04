class Shop < ActiveRecord::Base
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }

  include Status
  
  belongs_to :event
end
