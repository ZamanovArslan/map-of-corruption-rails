class DeedsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    @deeds = Deed.all
  end

  def show
    @deed = Deed.find params[:id]
  end

  def new
  end

  def edit
  end

  def create
    @deed = Deed.new(deed_params)
    respond_to do |format|
      if @deed.save!
        flash[:success] = "Дело успешно добавлено"
        format.html {redirect_to @deed}
        format.json {render :show, status: :created, location: @deed}
      else
        format.html {render :new}
        format.json {render json: @deed.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @deed.update(deed_params)
        flash[:success] = "Дело успешно обновлено"
        format.html {redirect_to @deed}
        format.json {render :show, status: :ok, location: @deed}
      else
        format.html {render :edit}
        format.json {render json: @deed.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @deed = Deed.find params[:id]
    @deed.destroy
    respond_to do |format|
      format.html {redirect_to deeds_url, notice: 'Deed was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def capitalize(params)
    params.each do |key, value|
      value.capitalize! if key != :region_code
    end
  end

  def deed_params
    params.require(:deed).permit(:position, :sign, :detriment, :punishment, :status, :date, :deputy_id, :region_id)
  end
end