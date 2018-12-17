class GameState
  attr_accessor :player, :locations, :items, :objectives

  def initialize(attributes)
    @player = attributes.fetch(:player, player = Player.create({:name => 'chester',:location_id => 1,:objective_id => 0}))

    @objectives = attributes.fetch(:objectives, [@player.objectives.create({:description => 'new objective', :complete => false})])

    if attributes.keys.include?(:locations)
      @locations = attributes.fetch(:locations)
    else
      @objectives[0].locations.create({
        :transition => 'Welcome!',
        :pre_description => 'for now, I look like this',
        :post_description => 'after that thing, I look like this now.',
        :puzzle_solved => false
      })
      @locations = @objectives[0].locations

    end


    @items = attributes.fetch(:items,
      [@locations[0].item = @player.items.create({
        :name => 'Hammer',
        :description => 'Shiny metal on a piece of woody stick',
        :found => false
      })
    ])

    if @player.location_id == 0
      @player.location_id = @locations[0].id
    end

    # state of game before play.
    @player_pre_game = @player
    @objectives_pre_game = @objectives
    @locations_pre_game = @locations
    @items_pre_game = @items
  end

  def player_items
    items_held = []
    @items.each do |item|
      if item.found
        items_held.push(item)
      end
    end
    items_held
  end

  def move_to(location_id)
    @locations.each do |local|
      if local.id == location_id
        @player.location_id = location_id
        return local.id
      end
    end
    @player.location_id
  end

end
