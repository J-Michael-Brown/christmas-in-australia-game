class GameState
  attr_reader(:player, :items, :locations, :objectives)

  def initialize(attributes)
    @player = Player.find(attributes.fetch(:player_id))

    @items = []
    items = Item.all
    items.each do |item|
      if item.player_id == @player.id
        @items.push(item)
      end
    end


    @locations = []
    locations = Location.all
    locations.each do |location|
      if location.player_id == @player.id
        @locations.push(location)
      end
    end

    @objectives = []
    objectives = Objective.all
    objectives.each do |objective|
      if objective.player_id == @player.id
        @objectives.push(objective)
      end
    end
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
