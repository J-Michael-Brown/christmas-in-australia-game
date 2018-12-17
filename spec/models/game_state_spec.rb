require ('rails_helper')

describe '#player_items' do
  it 'returns list of player\'s held items.' do
    player = Player.new({
      :name => 'chester',
      :location_id => 1,
      :objective_id => 1
    })
    player.save()
    location = player.locations.new({
      :transition => 'Welcome!',
      :pre_description => 'for now, I look like this',
      :post_description => 'after that thing, I look like this now.',
      :puzzle_solved => false
    })
    location.save
    item = Item.new({
      :name => 'Hammer',
      :description => 'Shiny metal on a piece of woody stick',
      :found => false
    })
    item.save
    location.item = item

    location2 = player.locations.new({
      :transition => 'Goodbye',
      :pre_description => 'You\'re now walking away',
      :post_description => 'Goodluck in your adventure',
      :puzzle_solved => false
    })
    location2.save
    item2 = Item.new({
      :name => 'Sword',
      :description => 'Shiny sharp metal',
      :found => true
    })
    item2.save
    location2.item = item2

    game = GameState.new({
      :player => player,
      :locations => [location, location2],
      :items => [item, item2],
      :objectives => []
    })


    expect(game.player_items).to(eq([item2]))


  end
end
