class Option < ActiveRecord::Base
  belongs_to :location

  validates :action, :presence => true
  # validates :value, :presence => true
end
