class GameController < ApplicationController
  def index
    render :index
  end

  def start
    start = params.fetch("player_input").upcase
    binding.pry
    if start == "START"
      redirect "/gamestart"
      render :gamestart
    end
    render :index
  end
end
