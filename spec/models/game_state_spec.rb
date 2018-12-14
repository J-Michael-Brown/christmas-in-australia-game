require 'rails_helper'

describe GameState do
  describe '.initialize'
  it 'initiates a new player' do
    player = Player.new({
      :name => "Mikey",
      :location_id => 1,
      :objective_id => 1
    })
    player.save

    objective = Objective.new({
      :description => "Solve this puzzle",
      :complete => true,
      :player_id => player.id
    })
    objective.save

    location = Location.new({
      :objective_id => objective.id,
      :transition => "welcome to the area",
      :pre_description => "you are here",
      :post_description => "You are leaving",
      :puzzle_solved => false,
      :player_id => player.id
    })
    location.save

    item = Item.new({
      :location_id => location.id,
      :name => "Grandma's Compass",
      :description => "Helps find your way",
      :found => true,
      :player_id => player.id
    })
    item.save
    game_state = GameState.new({:player_id => player.id})
    expect(game_state.player).to(eq(player))
  end
end
