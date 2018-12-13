class Item < ActiveRecord::Base
  validates :location_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :player_id, :presence => true
  validates_inclusion_of :found, :in => [true, false]

  private
  def display_item_info
    Hash.new({:name => @name, :description => @description})
  end
end
