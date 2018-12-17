class GameState
  attr_accessor :player, :locations, :items, :objectives

  def initialize(attributes)
    @player = attributes.fetch(:player)
    @locations = attributes.fetch(:locations)
    @items = attributes.fetch(:items)
    @objectives = attributes.fetch(:objectives)
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

end
