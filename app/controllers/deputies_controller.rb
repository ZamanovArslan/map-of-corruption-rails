class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all
  end

  def new
    @deputy = Deputy.new
  end

  def create

    @deputy = Deputy.new (capitalize deputy_params)
    @deputy.save
    redirect_to @deputy
  end

  def show
    @deputy = Deputy.find(params[:id])
  end

  def edit
    @deputy = Deputy.find(params[:id])
  end

  def update
    @deputy = Deputy.find(params[:id])

    if @deputy.update(capitalize deputy_params)
      redirect_to @deputy
    else
      render 'edit'
    end
  end

  def destroy
    @deputy = Deputy.find(params[:id])
    @deputy.destroy

    redirect_to deputies_path
  end

  private
    def deputy_params
      params.require(:deputy).permit(:name, :surname, :patronymic, :current_position)
    end

    def capitalize(params)
      params.each do |key, value|
        value.capitalize!
      end
    end
end
