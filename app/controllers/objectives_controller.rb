class ObjectivesController < ApplicationController
  def index
    @objectives = Objective.all
  end

  def show
    @objective = Objective.find(params[:id])
  end

  def update
    @objective = Objective.find(params[:id])

    # if @objective.options.include?()
    #
    # end
  end


end
