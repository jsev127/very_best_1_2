class Api::V1::VenuesController < Api::V1::GraphitiController
  def index
    venues = VenueResource.all(params)
    respond_with(venues)
  end

  def show
    venue = VenueResource.find(params)
    respond_with(venue)
  end

  def create
    venue = VenueResource.build(params)

    if venue.save
      render jsonapi: venue, status: :created
    else
      render jsonapi_errors: venue
    end
  end

  def update
    venue = VenueResource.find(params)

    if venue.update_attributes
      render jsonapi: venue
    else
      render jsonapi_errors: venue
    end
  end

  def destroy
    venue = VenueResource.find(params)

    if venue.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: venue
    end
  end
end
