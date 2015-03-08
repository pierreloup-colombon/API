class Ticket < ActiveRecord::Base
 # belongs_to :activitie

  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }
end
