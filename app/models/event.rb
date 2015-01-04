class Event < ActiveRecord::Base
  validates :name,        length: { minimum: 4 }
  validates :description, length: { minimum: 16 }
  validates :date,        presence: true
end
