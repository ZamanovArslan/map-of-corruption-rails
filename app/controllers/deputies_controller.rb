class DeputiesController < ApplicationController
  load_and_authorize_resource
  before_action only: %i[show edit update destroy]

  def index
    @deputies = Deputy.all
  end

  def new
    @deputy = Deputy.new
  end

  # TODO
  # decent_exposure
  # responders

  def create
    @deputy = Deputy.new deputy_params
    @deputy.admin_id = current_admin.id if current_admin
    if @deputy.save
      flash[:success] = "Депутат успешно добавлен"
      redirect_to @deputy
    else
      render "edit"
    end
  end

  def show
    @deputy = Deputy.find(params[:id])
    @deputy.update(views: @deputy.views + 1)
  end

  def edit
    @deputy = Deputy.find(params[:id])
  end

  def update
    @deputy = Deputy.find(params[:id])
    if @deputy.update(deputy_params)
      flash[:success] = "Депутат успешно изменен"
      redirect_to @deputy
    else
      render "edit"
    end
  end

  def destroy
    @deputy = Deputy.find(params[:id])
    @deputy.destroy
    flash[:success] = "Депутат успешно удален"
    redirect_to deputies_path
  end

  private

  def deputy_params
    params.require(:deputy).permit(:name, :surname, :patronymic, :current_position, :image)
  end

  def capitalize(params)
    params.each do |key, value|
      value.capitalize! if key != :photo
    end
  end
end
