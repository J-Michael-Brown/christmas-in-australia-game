require ('rails_helper')

def game_on
  player = Player.new({:name => 'Tester', :location_id => 0, :objective_id => 0})
  player.save

  objective = player.objectives.create({:description => 'find compass', :complete => false})

  player.objective_id = objective.id

  location1 = objective.locations.create({:sign => 'doorway', :transition => 'Welcome!', :pre_description => 'for now, I look like this', :post_description => 'after that thing, I look like this now.', :puzzle_solved => false})

  location2 = objective.locations.create({:sign => 'exit', :transition => 'Go away!', :pre_description => 'for now, I look like this', :post_description => 'after that thing, I look like this now.', :puzzle_solved => true})

  player.location_id = location1.id
  player.update({:location_id => player.location_id, :objective_id => player.objective_id})

  sword = Item.new({
    :name => 'Sword',
    :description => 'Shiny sharp metal',
    :found => true
  })
  sword.save
  location1.item = sword
  hammer = Item.new({
    :name => 'Hammer',
    :description => 'Shiny metal on a piece of woody stick',
    :found => false
  })
  hammer.save
  location2.item = hammer

  game = GameState.new({
    :player => player
  })

  game
end

describe '#player_items' do
  it 'returns list of player\'s held items.' do
    game = game_on()

    expect(game.player_items.length).to(eq(1))
  end
end

describe '#move_to(location)' do
  it 'return player\'s location' do

  location_one = Location.new({
    :transition => 'Goodbye',
    :pre_description => 'You\'re now walking away',
    :post_description => 'Goodluck in your adventure',
    :puzzle_solved => false
  })
  game = game_on
  game.player.objectives[0].locations.push(location_one)

  expect(game.move_to(location_one.id)).to(eq(location_one.id))

end
end
