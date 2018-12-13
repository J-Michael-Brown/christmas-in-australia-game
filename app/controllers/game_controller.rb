class GameController < ApplicationController
  def index
    render :index
  end

  def start
    start = params.fetch("player_input").upcase
    if start == "START"

      render :gamestart
    else
      render :index
    end
  end

  def bed_logic
    @time_hour = 8
    @time_minute = 4

    input = params.fetch("player_start_input").upcase
    # if input == "GO BACK TO SLEEP" || "SLEEP" || "GO TO SLEEP"
    #   @time_hour + 1
    #   @time_minute + 30
    #   if @time_minute >= 60
    #     @time_minute = 0
    #   end
    #   if @time_hour >= 12
    #     @time_hour = 1
    #   end
    # end
    if input == "TEST"
      true
      render :gamestart
    end
  end
end
