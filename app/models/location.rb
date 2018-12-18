class Location < ActiveRecord::Base
  belongs_to :objective
  has_one :item
  # belongs_to :player
  has_many :options

  validates :sign, :presence => true
  validates :transition, :presence => true
  validates :pre_description, :presence => true
  validates :post_description, :presence => true
  validates_inclusion_of :puzzle_solved, :in => [true, false]
end
