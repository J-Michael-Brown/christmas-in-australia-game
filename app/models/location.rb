class Location < ActiveRecord::Base
  validates :transition, :presence => true
  validates :pre_description, :presence => true
  validates :post_description, :presence => true
  validates :objective_id, :presence => true
  validates :player_id, :presence => true
  validates_inclusion_of :puzzle_solved, :in => [true, false]
end
