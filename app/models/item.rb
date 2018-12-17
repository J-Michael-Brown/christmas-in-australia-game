class Item < ActiveRecord::Base
  belongs_to :location
  belongs_to :player

  validates :name, :presence => true
  validates :description, :presence => true
  validates_inclusion_of :found, :in => [true, false]

  def held_by
    if @found
      'player'
    else
      Location.find(@location_id)
    end
  end
end
