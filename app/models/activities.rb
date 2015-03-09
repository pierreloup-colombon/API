class Activities < ActiveRecord::Base
  validates :name      length: { minimum: 4 }
  validates :description length: { minimum: 16 }
  validates :start_at, :end_at, :presence => true

end
