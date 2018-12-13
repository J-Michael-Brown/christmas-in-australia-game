class Objective < ActiveRecord::Base
  validates :description, :presence => true
  validates_inclusion_of :complete, :in => [true, false]
end
