class Item < ActiveRecord::Base
  belongs_to :location
  validates :location_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
end
