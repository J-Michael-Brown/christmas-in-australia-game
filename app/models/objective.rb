class Objective < ActiveRecord::Base
  has_many :locations
  belongs_to :player

  validates :description, :presence => true
  validates_inclusion_of :complete, :in => [true, false]
end
