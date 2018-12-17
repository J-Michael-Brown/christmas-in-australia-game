class GameController < ApplicationController

  @@counter = 0

  def index
    render :index
  end

  def start
    start = params.fetch("player_input").upcase
    if start == "START"
      @location = Location.new({:transition => 'Welcome!', :pre_description => 'for now, I look like this', :post_description => 'after that thing, I look like this now.', :puzzle_solved => false, :id => 1, :objective_id => 1, :player_id => 1})
      @location.save
      @objective = Objective.new({:player_id => 1, :description => 'find compass', :complete => false})
      @objective.save
      location_id = @location.id
      @player = Player.new({:name => 'Tester', :location_id => location_id, :objective_id => nil, :id => 1})
      @player.save()
      @default = true
      @@counter = 0
      render :gamestart
    else
      render :index
    end
  end

  def bed_logic
    input = params.fetch("player_start_input").upcase
    if input == (("SLEEP") || ("GO BACK TO SLEEP") || ("GO TO SLEEP"))
      @default = false
      @@counter = @@counter + 1
      if @@counter == 1
        @slept = true
        @time = "9:32AM"
      elsif @@counter == 2
        @slept = true
        @time = "11:18AM"
      elsif @@counter == 3
        @slept = true
        @time = "12:45PM"
      elsif @@counter == 4
        @slept = true
        @time = "1:37PM"
      elsif @@counter == 5
        @slept = true
        @time = "3:59PM"
      elsif @@counter == 6
        @slept = false
      end
      @tired = true
      render :gamestart
    elsif input == (("FEED") || ("FEED CAT") || ("GET UP AND FEED CAT"))
      @default = false
      @slept = false
      if @@counter >= 1
        @hungry = true
      else
        @feeds = true
      end
      render :gamestart
    elsif input == (("PET") || ("PET CAT"))
      @default = false
      @slept = false
      @hungry = false
      @feeds = false
      @pets = true
      render :gamestart
    end
  end
end
