# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
location_list = [
  ["You've just showed up, havn't you?", "this place looks like this first. There's a puzzle active", "This place looks like this later. The puzzle has been solved.", false],
  ["You've just showed up to this new place, havn't you?", "This is what this other place looked like at first.", "This second place looks like this after the puzzle.", false]
]

location_list.each do |transition, pre_description, post_description, puzzle_solved|
  Location.create({
    :transition => transition,
    :pre_description => pre_description,
    :post_description => post_description,
    :puzzle_solved => puzzle_solved
  })
end

locations = Location.all


item_list = [
  [locations[0], 'item 1', "Item 1 does some stuff and things."],
  [locations[1], 'item 2', "Item 2 does some stuff and things as well."]
]

item_list.each do |location_id, name, description|
  Item.create({
    :location_id => location_id,
    :name => name,
    :description => description
  })
