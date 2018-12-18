class Option < ActiveRecord::Base
  belongs_to :location
  # belongs_to :player

  validates :action, :presence => true
end
