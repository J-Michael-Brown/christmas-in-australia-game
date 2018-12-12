class Player < ActiveRecord::Base
  validates :name, :presence => true
  validates :location_id, :presence => true
  validates :objective_id, :presence => true
end
