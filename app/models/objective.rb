class Objective < ActiveRecord::Base
  has_many :locations

  validates :player_id, :presence => true
  validates :description, :presence => true
  validates_inclusion_of :complete, :in => [true, false]
end
