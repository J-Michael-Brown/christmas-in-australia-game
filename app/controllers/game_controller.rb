require "pry"

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
   @header = "After ignoring the old rodents concerns. You make your way through the desert path and approach the old Quarry. Baffled.. you see it's a pack of christmas elves in the middle of the australian outback. One noticeably large elf sees you and approaches."
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
      @header = "The elf approaches you with extreme levels of christmas cheer. You tell the elf to leave the old quarry and he responds 'I SHALL LEAVE ONLY IF YOU SOLVE MY RIDDLE!!?"
      @choice = "Do you accept his holiday challenge?"
      @image = "/elf.png"
      @option1 = "(Y) | you accept the challenge"
      @option2 = "(N) | bad vides.. you walk away"
      render :scene2
    elsif input == ("Y")
      @header = "You accept the jolly elf's challenge. "
      @story = "He prances and dances and then turns to you with a grin, and asks the first riddle:"
      @choice = "I describe a toilet cleaner as well as one of Santa's reindeer. What am I?"
      @option1 = "Rudolph"
      @option2 = "Comet"
      @option3 = "Blixen"
      render :scene2
    elsif input == ("COMET")
      # Update database with objective 1 here
      @header = "You successfully solved the elves first riddle"
      @story = "He looks at you flustered and flabbergasted. He asks another riddle:"
      @choice = "What do snowmen eat for breakfast?"
      @option1 = "Shake n' Bake"
      @option2 = "Snowflakes"
      render :scene2
    elsif input == ("SNOWFLAKES")
      # Update database with objective 1 here
      @header = "You solved all riddles!"
      @story = "His elf facade fades and Ron Burgundy appears:  "
      @image = "/willferrel.png"
      @dialogue = "He admits defeat, Ron and his pack of elves leave the quarry. Feeling accomplished you skip on your merry way through the australlian outback until you hit a fork in the road"
      @choice = "Which way do you go?"
      @option1 = "Left"
      @option2 = "Right"
      @option3 = "(Use) | grandma's compass"
      render :scene3
    else
      @header = "You conclude that this situation is too difficult for you. You stick to your guts and pretend not to have noticed the overly jolly man elf and speed off down the path. You wonder if you should have just stayed in bed today."
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
      @header= "You open grandma's old compass. It does nothing"
      @story= "As you look down towards the general direction of hell where you assume your grandma is.. you see a literal fork on the ground:"
      @dialogue= "You've acquired A Rusty Fork"
      @choice = "You still find yourself at a fork in the road:"
      @option1 = "Left"
      @option2 = "or"
      @option3 = "Right"
      # SAVE FORK TO DATABASE HERE
      render :scene3
    elsif input == (("LEFT") || ("GO LEFT"))
      @header = "You head left"
      @story= "You continue on your journey and wonder why you chose left when you could have chose the thrilling adventure to the right"
      @choice = "What do you do?"
      @option1 = "Right"
      @option2 = "STAY"
      render :scene3
    elsif input == (("RIGHT") || ("GO RIGHT"))
      @header = "You head right"
      @story= "You continue on your journey and wonder why you chose right when you could have chose the thrilling adventure to the left"
      @dialogue = ""
      @choice = "What do you do?"
      @option1 = "Left"
      @option2 = "Stay"
      render :scene3
    else input == ("STAY")
      @header = "You continue down your path"
      @story= "As you continue your journey you"
      @dialogue = "As you walk down the path. You notice a old fat man and a reigndeer wondering about"
      @choice = "What do you do?"
      @option1 = "go left"
      @option2 = "Stay"
      render :scene4
    end
  end
end
