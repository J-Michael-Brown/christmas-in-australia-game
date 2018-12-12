class Objective < ActiveRecord::Base
  has_many :locations
  validates :description, :presence => true
  validates :complete, :presence => true
end
