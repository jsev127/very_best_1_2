class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(distinct: true).includes(:cuisine, :bookmarks,
                                                 :fans, :specialists).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      message = "Dish was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @dish, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish, notice: "Dish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    message = "Dish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to dishes_url, notice: message
    end
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :cuisine_id)
  end
end
