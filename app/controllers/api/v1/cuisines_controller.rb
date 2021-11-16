class Api::V1::CuisinesController < Api::V1::GraphitiController
  def index
    cuisines = CuisineResource.all(params)
    respond_with(cuisines)
  end

  def show
    cuisine = CuisineResource.find(params)
    respond_with(cuisine)
  end

  def create
    cuisine = CuisineResource.build(params)

    if cuisine.save
      render jsonapi: cuisine, status: :created
    else
      render jsonapi_errors: cuisine
    end
  end

  def update
    cuisine = CuisineResource.find(params)

    if cuisine.update_attributes
      render jsonapi: cuisine
    else
      render jsonapi_errors: cuisine
    end
  end

  def destroy
    cuisine = CuisineResource.find(params)

    if cuisine.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: cuisine
    end
  end
end
