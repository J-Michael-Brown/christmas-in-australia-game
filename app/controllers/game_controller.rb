class GameController < ApplicationController


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
    @counter = 0

    input = params.fetch("player_start_input").upcase
    if input == "GO BACK TO SLEEP" || "SLEEP" || "GO TO SLEEP"
      @counter += 1
      #   if @time_minute >= 60
      #     @time_minute = 0
      #   end
      #   if @time_hour >= 12
      #     @time_hour = 1
      #   end
      # end
      if input == "TEST"
        @test = true
        @default = false
      end
      render :gamestart
    end
  end
end
