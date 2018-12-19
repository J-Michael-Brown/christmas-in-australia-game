class GameState
  attr_accessor :player, :player_pre_game, :locations_pre_game, :items_pre_game, :objectives_pre_game

  def initialize(attributes)
    @player = attributes.fetch(:player)
    player = attributes.fetch(:player, player = Player.create({:name => 'chester',:location_id => 0,:objective_id => 0}))
    @counter = attributes.fetch(:counter)

  end

  def bed_logic(input)
    default = false
    tired = false
    time = "8:04"
    slept = false
    hash = {:render => :gamestart, :tired => tired, :slept => slept, :default => default, :time => time}


    if input == (("SLEEP") || ("GO BACK TO SLEEP") || ("GO TO SLEEP"))

      slept = true
      @counter += 1
      if @counter == 1
        time = "9:32AM"
      elsif @counter == 2
        time = "11:18AM"
      elsif @counter == 3
        time = "12:45PM"
      elsif @counter == 4
        time = "1:37PM"
      elsif @counter == 5
        time = "3:59PM"
      elsif @counter >= 6
        slept = false
      end
      tired = true
      hash.update({:tired => tired, :slept => slept, :time => time})
      return hash
    elsif input == (("FEED") || ("FEED CAT") || ("GET UP AND FEED CAT"))

      if @counter >= 1
        hungry = true
      else
        feeds = true
      end
      hash.update({:hungry => hungry, :feeds => feeds})
      return hash
    elsif input == (("PET") || ("PET CAT") || ("PET MY CAT"))

      hungry = false
      feeds = false
      pets = true
      hash.update({:hungry => hungry, :feeds => feeds, :pets => pets, :tired => tired, :default => default, :time => time})
      return hash
    elsif input == (("PHONE") || ("CHECK PHONE") || ("CHECK THE PHONE"))

      hungry = false
      feeds = false
      pets = false
      phone = true
      hash.update({:hungry => hungry, :feeds => feeds, :pets => pets, :render => :area1, :tired => tired, :slept => slept, :default => default, :time => time, :phone => true})
      return hash
    else
      default = true
      hash.update({:hungry => hungry, :feeds => feeds, :pets => pets, :tired => tired, :slept => slept, :default => default, :time => time})
      return hash
    end

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
