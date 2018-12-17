class Location < ActiveRecord::Base
  belongs_to :objective
  has_one :item

  validates :player_id, :presence => true
  validates :transition, :presence => true
  validates :pre_description, :presence => true
  validates :post_description, :presence => true
  # validates :objective_id, :presence => true
  validates_inclusion_of :puzzle_solved, :in => [true, false]
end
