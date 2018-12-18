class GameState
  attr_accessor :player, :player_pre_game, :locations_pre_game, :items_pre_game, :objectives_pre_game

  def initialize(attributes)
    @player = attributes.fetch(:player)
    player = attributes.fetch(:player, player = Player.create({:name => 'chester',:location_id => 0,:objective_id => 0}))

    # # state of game before play.
    @player_pre_game = @player
    @objectives_pre_game = @player.objectives
    @locations_pre_game = []
    @items_pre_game = []
    @objectives_pre_game.each do |objective|
      objective.locations.each do |location|
        @locations_pre_game.push(location)
        @items_pre_game.push(location.item)
      end
    end
    @player
  end

  def locations
    locations_array = []
    @player.objectives.each do |objective|
      objective.locations.each do |location|
        locations_array.push(location)
      end
    end
    locations_array
  end

  def player_items
    items_held = []
    self.locations.each do |location|
        item = location.item
        if item.found
          items_held.push(item)
        end
      end
    items_held
  end

  def move_to(location_id)
    self.locations.each do |local|
      if local.id == location_id
        @player.location_id = location_id
        @player.update({:location_id => @player.location_id})
        return local.id
      end
    end
    @player.location_id
  end

end
