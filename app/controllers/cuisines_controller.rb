class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]

  # GET /cuisines
  def index
    @cuisines = Cuisine.page(params[:page]).per(10)
  end

  # GET /cuisines/1
  def show
    @dish = Dish.new
  end

  # GET /cuisines/new
  def new
    @cuisine = Cuisine.new
  end

  # GET /cuisines/1/edit
  def edit
  end

  # POST /cuisines
  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to @cuisine, notice: 'Cuisine was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cuisines/1
  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine, notice: 'Cuisine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cuisines/1
  def destroy
    @cuisine.destroy
    redirect_to cuisines_url, notice: 'Cuisine was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cuisine_params
      params.require(:cuisine).permit(:name)
    end
end
