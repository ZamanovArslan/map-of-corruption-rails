class RegionController < ApplicationController
  def show
    @deeds = Deed.find_by_region_code(params[:region_code])
    render json: @deeds
  end
end
