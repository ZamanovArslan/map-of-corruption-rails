class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all
  end

  def new
    @deputy = Deputy.new
  end

  def create
    params[:deputy].each do |key, value|
      value.capitalize!
    end
    @deputy = Deputy.new (params[:deputy].permit(:name, :surname, :patronymic, :current_position))
    @deputy.save
    redirect_to @deputy
  end

  def show
    @deputy = Deputy.find(params[:id])
    @title = Deputy.find(params[:id]).name
  end

  def update
    @deputy = Deputy.find(params[:id])

    if @deputy.update(params[:deputy].permit(:name, :surname, :patronymic, :current_position))
      redirect_to @deputy
    else
      render 'edit'
    end
  end
end
