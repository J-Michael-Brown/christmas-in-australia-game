class Player < ActiveRecord::Base
  # has_many :locations
  # has_many :items
  has_many :objectives
  # has_many :options

  validates :name, :presence => true
  validates :location_id, :presence => true
  validates :objective_id, :presence => true


end
