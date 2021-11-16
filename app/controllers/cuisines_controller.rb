class CuisinesController < ApplicationController
  before_action :set_cuisine, only: %i[show edit update destroy]

  def index
    @q = Cuisine.ransack(params[:q])
    @cuisines = @q.result(distinct: true).includes(:dishes).page(params[:page]).per(10)
  end

  def show
    @dish = Dish.new
  end

  def new
    @cuisine = Cuisine.new
  end

  def edit; end

  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      redirect_to @cuisine, notice: "Cuisine was successfully created."
    else
      render :new
    end
  end

  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine, notice: "Cuisine was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @cuisine.destroy
    redirect_to cuisines_url, notice: "Cuisine was successfully destroyed."
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
