class Api::V1::DishesController < Api::V1::GraphitiController
  def index
    dishes = DishResource.all(params)
    respond_with(dishes)
  end

  def show
    dish = DishResource.find(params)
    respond_with(dish)
  end

  def create
    dish = DishResource.build(params)

    if dish.save
      render jsonapi: dish, status: :created
    else
      render jsonapi_errors: dish
    end
  end

  def update
    dish = DishResource.find(params)

    if dish.update_attributes
      render jsonapi: dish
    else
      render jsonapi_errors: dish
    end
  end

  def destroy
    dish = DishResource.find(params)

    if dish.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: dish
    end
  end
end
