# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


objective_list = [
  ["The complete objective description", false],
  ["Another objective.", false]
]
objectives = []
objective_list.each do |description, complete|
  thing = Objective.new({
    :description => description,
    :complete => complete
    })
    thing.save
    objectives.push(thing)
  end

location_list = [
  [objectives[0].id, "You've just showed up, havn't you?", "this place looks like this first. There's a puzzle active", "This place looks like this later. The puzzle has been solved.", false],
  [objectives[0].id, "You've just showed up to this new place, havn't you?", "This is what this other place looked like at first.", "This second place looks like this after the puzzle.", false]
]

locations = []
location_list.each do |objective_id, transition, pre_description, post_description, puzzle_solved|
  thing = Location.new({
    :objective_id => objective_id,
    :transition => transition,
    :pre_description => pre_description,
    :post_description => post_description,
    :puzzle_solved => puzzle_solved
  })
  thing.save
  locations.push(thing)
end



item_list = [
  [locations[0].id, 'item 1', "Item 1 does some stuff and things.", false],
  [locations[1].id, 'item 2', "Item 2 does some stuff and things as well.", false]
]
item_list.each do |location_id, name, description, found|
  Item.create({
    :location_id => location_id,
    :name => name,
    :description => description,
    :found => found
  })
end

#
# Objective.create( :description => "The complete objective description", :complete => false )
# Objective.create({ :description => "Another objective.", :complete => false })



player_list = [
  ["player 1 name", locations[0].id, objectives[0].id],
  ["player 2 name", locations[1].id, objectives[1].id]
]
player_list.each do |name, location_id, objective_id|
  Player.create ({
    :name => name, :location_id => location_id, :objective_id => objective_id
  })
end
