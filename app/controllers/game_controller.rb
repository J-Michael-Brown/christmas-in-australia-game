class GameController < ApplicationController

  @@counter = 0

  def index
    render :index
  end

  def start
    start = params.fetch("player_input").upcase
    if start == "START"
      @default = true
      render :gamestart
    else
      render :index
    end
  end

  def bed_logic

    input = params.fetch("player_start_input").upcase
    if input == "GO BACK TO SLEEP" || "SLEEP" || "GO TO SLEEP"
      @default = false
      @@counter = @@counter + 1
        if @@counter == 1
          @time = "9:32AM"
        elsif @@counter == 2
          @time = "11:18AM"
        end
      @slept = true
      render :gamestart
    end
  end
end
