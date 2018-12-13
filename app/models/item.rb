class Item < ActiveRecord::Base
  validates :location_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates_inclusion_of :found, :in => [true, false]

  private
  def method_name

  end
end
