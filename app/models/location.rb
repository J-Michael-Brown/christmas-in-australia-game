class Location < ActiveRecord::Base
  belongs_to :objectives
  validates :transition, :presence => true
  validates :pre_description, :presence => true
  validates :post_description, :presence => true
  validates :puzzle_solved, :presence => true
end
