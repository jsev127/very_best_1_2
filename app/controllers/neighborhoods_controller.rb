class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: %i[show edit update destroy]

  # GET /neighborhoods
  def index
    @q = Neighborhood.ransack(params[:q])
    @neighborhoods = @q.result(distinct: true).includes(:venues).page(params[:page]).per(10)
  end

  # GET /neighborhoods/1
  def show
    @venue = Venue.new
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit; end

  # POST /neighborhoods
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    if @neighborhood.save
      redirect_to @neighborhood,
                  notice: "Neighborhood was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /neighborhoods/1
  def update
    if @neighborhood.update(neighborhood_params)
      redirect_to @neighborhood,
                  notice: "Neighborhood was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /neighborhoods/1
  def destroy
    @neighborhood.destroy
    redirect_to neighborhoods_url,
                notice: "Neighborhood was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end
