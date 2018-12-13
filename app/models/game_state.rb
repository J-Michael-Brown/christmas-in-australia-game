class GameState
  attr_reader(:player, :items, :locations, :objectives)

  def initialize(attributes)
    @player = attributes.fetch(:player)
    item_ids = []
    location_booleans(item = true/false) = []

    @items = attributes.fetch(:items)
    @locations = attributes.fetch(:locations)
    @objectives = attributes.fetch(:objectives)
  end

  def find_location(location_id)
    @locations.each do |location|
      if location.id == location_id
        return location
      end
    end
  end

  def player_items
    held = []
    @items.each do |item|
      if item.found
        held.push(item)
      end
    held
  end

  def player_location(location_id = @player.location_id)
    @player.location_id = location_id
    self.find_location(@player.location_id)
  end

  def save_game
    @player.update
    @items.each do |item|
      item.update
    end
    @locations.each do |location|
      location.update
    end
    @objectives.each do |objective|
      objective.update
    end
  end

  
end
