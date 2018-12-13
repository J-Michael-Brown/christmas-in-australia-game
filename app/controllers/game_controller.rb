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
end
