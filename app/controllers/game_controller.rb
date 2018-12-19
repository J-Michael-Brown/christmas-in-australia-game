require "pry"

class GameController < ApplicationController





  def start
    start = params.fetch("player_input").upcase
    if start == "START"
      @player = Player.new({:name => 'Tester', :location_id => 0, :objective_id => 0})
      @player.save

      @objective = @player.objectives.create({:description => 'find compass', :complete => false})

      @player.objective_id = @objective.id

      @location = @objective.locations.create({:sign => 'Bed', :transition => "You awake to the feeling of your cat jumping on your bed. It feels a little later than you usually wake up in the morning. With no alarm other than your hungry cat kneading into your head, you remember today is a holiday.", :pre_description => 'for now, I look like this', :post_description => 'after that thing, I look like this now.', :puzzle_solved => false})

      @player.location_id = @location.id
      @player.update({:location_id => @player.location_id, :objective_id => @player.objective_id})
      @game_state = GameState.new({:player => @player})
      binding.pry


      @option1 = @location.options.create({:action => "Go back to sleep"})
      @option2 = @location.options.create({:action => "Feed cat"})
      @option3 = @location.options.create({:action => "Check phone"})
      @default = true
      @counter = 0

      render :gamestart
    else
      render :index
    end
  end

  def bed_logic
    binding.pry
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
    elsif input == (("PET") || ("PET CAT") || ("PET MY CAT"))
      @default = false
      @slept = false
      @hungry = false
      @feeds = false
      @pets = true
      render :gamestart
    elsif input == (("PHONE") || ("CHECK PHONE") || ("CHECK THE PHONE"))
      @default = false
      @slept = false
      @hungry = false
      @feeds = false
      @pets = false
      @phone = true
      @objective = @objective
      @player = @player
      @location = @location
      @header = "Before you step out of your cozy home, you notice your late grandmother's favorite compass, You inspect the compass. It shows 3 north's and an east. You can't help but wonder if this is the reason grandma was constantly taking left turns. What do you do?"
      @choice = "Do you take the compass?"
      @option1 = "Take it"
      @option2 = "Leave it"
      render :scene1
    else
      @default = true
      render :gamestart
    end
  end

  def start_scene_1
    @header = "Before you step out of your cozy home, you notice your late grandmother's favorite compass, You inspect the compass. It shows three north's and an east. You can't help but wonder if this is the reason grandma was constantly taking left turns."
    @choice = "Do you take the compass?"
    @option1 = "Take it"
    @option2 = "Leave it"
    render :scene1
  end

  def scene1_game
    input = params.fetch("player_scene1_input").upcase
    if input == (("TAKE IT") || ("TAKE"))

    @header = "You happily took Grandma's compass!"
    @story = "You say bye to your cat as you head out on your journey. You close your door behind you as you step into the brisk warm air of the australlian outback. The post apocolyptic wasteland you call home  is preparing for the upcoming holiday season. You look around and see your nieghbor Miles the Capybara setting up Christmas decorations in his capybarian home."
    @image = "/cool_capy.png"
    @dialogue = "Hey *&$@!, glad to see you've finally left the house. We need your help. a band of misfits have taken over the old quarry."
    @header = "You took Grandma's compass!"
    @story = "You say bye to your cat as you head out on your journey. You close your door behind you as you step into the brisk warm air of the australlian outback. The post apocolyptic wasteland you call home is preparing for the upcoming holiday season. You look around and see your nieghbor Miles the Capybara setting up Christmas decorations in his capybarian home."
    @image = "/capybara.png"
    @dialogue = "Hey @Player, glad to see you've finally left the house. We need your help. a band of misfits have taken over the old quarry."
    @choice = "Do you help?"
    @option1 = "(walk) | Pretend you don't notice him and continue walking, you assume he's asking for spare change"
    @option2 = "(talk) | Nod heroically in agreement and head to the old quarry"
    # Update compass item to database here
    render :scene1
  elsif
    input == (("TALK")|| ("ACCEPT"))
    @header = "After accepting the role of hero for our story you skip lacksidically through the great outback to the old quary. You approach the band of misfits only to find out that they're in fact... christmas elves. One noticeable large elf notices you and approaches."
    @choice = "What do you do next?"
    @option1 = "speak"
    @option2 = "ignore"
    render :scene2
  elsif
    input == (("WALK")|| ("INGORE"))
    @header = "After ignoring the old rodents concerns. You make your way through the desert path and approach the old Quarry. What you see shocks you It's a pack of christmas elves in the middle of the australian outback. One noticeable large elf notices you and approaches."
    @choice = "Do you speak to it or run away??"
    @option1 = "speak"
    @option2 = "ignore"
    render :scene2
  else
      @story = "You can't leave grandma's compass. How will you find your way without her guiding spirit and useless compass?"
      @choice = "Do you take the compass?"
      @option1 = "Take it"
      @option2 = "Take it"
      render :scene1
    end
  end


  def start_scene_2
    @header =
    @choice = "no cheating now"
    @option1 =
    @option2 =
    render :scene1
  end

  def scene2_game
    input = params.fetch("player_scene2_input").upcase
    if input == ("SPEAK")
      @header = "The elf approaches you with extreme levels of christmas cheer. You reluctantly speak to the elf: 'HEY FRIEND! I have a riddle for you?"
      @choice = "Do you accept his holiday challenge?"
      @image = "/elf.png"
      @option1 = "(Y) | you help the elf"
      @option2 = "(N) | bad vides.. you walk away"
      render :scene2
    elsif input == ("Y")
      @header = "You accept the jolly elf's challenge. "
      @story = "He prances and dances and then turns to you with a grin, and asks the first riddle:"
      @choice = "I describe a toilet cleaner as well as one of Santa's reindeer. What am I?"
      @option1 = ""
      @option2 = ""
      render :scene3
    else
      @header = "You conclude that this situation is too wierd for you. You stick to your guts and pretend not to have noticed the overly jolly man elf and speed off down the path. You wonder if you should have just stayed in bed today."
      @choice = "You continue on with your plain adventure. you find a fork in the road:"
      @option1 = "Go left"
      @option2 = "Go right"
      @option3 = "(Use) | grandma's compass"
      render :scene3
    end
  end

  def scene3_game
    input = params.fetch("player_scene3_input").upcase
    if input == ("USE")
      @story= "You open grandma's old compass. It does nothing"
      @choice = "You still find yourself at a fork in the road:"
      @option1 = "Go left"
      @option2 = "or"
      @option3 = "Go right"
    render :scene3
    # elsif
    # else
    end
  end
end
