# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


player = Player.new({:name => "Player 1", :location_id => 1, :objective_id => 1})
player.save

objective_list = [
  ["The complete objective description", false, player.id],
  ["Another objective.", false, player.id]
]
objectives = []
objective_list.each do |description, complete, player_id|
  thing = Objective.new({
    :description => description,
    :complete => complete,
    :player_id => player_id
  })
  thing.save
  objectives.push(thing)
end

location_list = [
  [objectives[0].id, "You've just showed up, havn't you?", "this place looks like this first. There's a puzzle active", "This place looks like this later. The puzzle has been solved.", false, player.id],
  [objectives[0].id, "You've just showed up to this new place, havn't you?", "This is what this other place looked like at first.", "This second place looks like this after the puzzle.", false, player.id]
]

locations = []
location_list.each do |objective_id, transition, pre_description, post_description, puzzle_solved, player_id|
  thing = Location.new({
    :objective_id => objective_id,
    :transition => transition,
    :pre_description => pre_description,
    :post_description => post_description,
    :puzzle_solved => puzzle_solved,
    :player_id => player_id
  })
  thing.save
  locations.push(thing)
end


item_list = [
  [locations[0].id, 'item 1', "Item 1 does some stuff and things.", false, player.id],
  [locations[1].id, 'item 2', "Item 2 does some stuff and things as well.", false, player.id]
]
item_list.each do |location_id, name, description, found, player_id|
  Item.create({
    :location_id => location_id,
    :name => name,
    :description => description,
    :found => found,
    :player_id => player_id
  })
end
