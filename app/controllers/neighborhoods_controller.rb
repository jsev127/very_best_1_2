class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: %i[show edit update destroy]

  def index
    @q = Neighborhood.ransack(params[:q])
    @neighborhoods = @q.result(distinct: true).includes(:venues).page(params[:page]).per(10)
  end

  def show
    @venue = Venue.new
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def edit; end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      redirect_to @neighborhood,
                  notice: "Neighborhood was successfully created."
    else
      render :new
    end
  end

  def update
    if @neighborhood.update(neighborhood_params)
      redirect_to @neighborhood,
                  notice: "Neighborhood was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @neighborhood.destroy
    redirect_to neighborhoods_url,
                notice: "Neighborhood was successfully destroyed."
  end

  private

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end
