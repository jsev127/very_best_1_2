class Api::V1::NeighborhoodsController < Api::V1::GraphitiController
  def index
    neighborhoods = NeighborhoodResource.all(params)
    respond_with(neighborhoods)
  end

  def show
    neighborhood = NeighborhoodResource.find(params)
    respond_with(neighborhood)
  end

  def create
    neighborhood = NeighborhoodResource.build(params)

    if neighborhood.save
      render jsonapi: neighborhood, status: :created
    else
      render jsonapi_errors: neighborhood
    end
  end

  def update
    neighborhood = NeighborhoodResource.find(params)

    if neighborhood.update_attributes
      render jsonapi: neighborhood
    else
      render jsonapi_errors: neighborhood
    end
  end

  def destroy
    neighborhood = NeighborhoodResource.find(params)

    if neighborhood.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: neighborhood
    end
  end
end
