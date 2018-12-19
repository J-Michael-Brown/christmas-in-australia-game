class PlayersController < ApplicationController
  def index
    @player = Player.new({:name => 'player name', :location_id => 1, :objective_id => 1})
    @player.save
    session[:current_player_id] = @player.id
  end

  # def create
  #   # ...
  #   session[:current_player_id] = @player.id
  #   # ...
  # end

  def show

    @player = Player.find(session[:current_player_id])
    # @player = Player.find(params[:player_id])
    input = params.fetch("player_start_input").upcase

    attributes = @game_state.bed_logic(input)
    @hungry = attributes.fetch(:hungry)
    @phone = attributes.fetch(:phone)
    @slept = attributes.fetch(:slept)
    @tired = attributes.fetch(:tired)
    @feeds = attributes.fetch(:feed)
    @pets = attributes.fetcht(:pets)
    @time = attributes.fetch(:time)

    render_to = attributes.fetch(:render, :gamestart)
    render render_to
  end

  def update
    @player = Player.find(params[:id])
  end

  def start
  end

  def bed_logic
  end

  def start_area_1
    @header = "Before you step out of your cozy home, you notice your late grandmother's favorite compass, You inspect the compass. It shows 3 north's and an east. You can't help but wonder if this is the reason grandma was constantly taking left turns. What do you do?"
    @choice = "Do you take the compass?"
    @option1 = "Take it"
    @option2 = "Leave it"
    render :area1
  end

  def area1_game
    input = params.fetch("player_area1_input").upcase
    if input == (("TAKE IT") || ("TAKE"))
    @header = "You happily took Grandma's compass!"
    @story = "You say bye to your cat as you head out on your journey. You close your door behind you as you step into the brisk warm air of the australlian outback. The post apocolyptic wasteland you call home  is preparing for the upcoming holiday season. You look around and see your nieghbor Miles the Capybara setting up Christmas decorations in his capybarian home."
    @image = "/capybara.png"
    @dialogue = "Hey *&$@!, glad to see you've finally left the house. We need your help. a band of misfits have taken over the old quarry."
    @choice = "Do you help?"
    @option1 = "1) Pretend you don't notice him and continue walking"
    @option2 = "2) Nod in agreement and head to the old quarry"
    # Update compass item to database here
    render :area1
  elsif
    input == (("TALK")|| ("ACCEPT"))
    @header = "After accepting the role of hero for our story you skip lacksidically through the great outback to the old quary. You approach the band of misfits only to find out that they're in fact christmas elves."
    @choice = "What do you do next??"
    @option1 = "plot sneak attack"
    @option2 = "full frontal assault"
    render :area2
  elsif
    input == (("WALK")|| ("INGORE"))
    @header = "After ignoring the old rodents command youYou head down to the path and approach the old Quarry. What you see blows your mind. It's a pack of christmas elves in the middle of the australian outback. One elf notices you and approaches."
    @choice = "Do you speak to it or run away??"
    @option1 = "speak"
    @option2 = "run"
    render :area2
  else
      @story = "You can't leave grandma's compass. How will you find your way without her guiding spirit and useless compass?"
      @choice = "Do you take the compass?"
      @option1 = "Take it"
      @option2 = "Take it"
      render :area1
    end
  end


  def start_area_2
    @header = "swooty"
    @choice =
    @option1 =
    @option2 =
    render :area1
  end

  def area2_game
    input = params.fetch("player_area2_input").upcase
    if input == (("accept") || ("nah"))
    @header = "You head down to the path and approach the old Quarry. What you see blows your mind. It's a pack of christmas elves in the middle of the australian outback. One elf notices you and approaches."
    @choice = "Do you speak to it or run away??"
    @option1 = "speak"
    @option2 = "run"
    render :area2
    end
  end


end
