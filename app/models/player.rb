class Player < ActiveRecord::Base
  has_many :locations
  has_many :items
  has_many :objectives

  validates :name, :presence => true
  validates :location_id, :presence => true
  validates :objective_id, :presence => true

  def holding
    DB.exec("SELECT * FROM items WHERE player_id = #{@id} AND found = true;")
  end
end
