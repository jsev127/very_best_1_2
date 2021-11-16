class VenuesController < ApplicationController
  before_action :set_venue, only: %i[show edit update destroy]

  def index
    @q = Venue.ransack(params[:q])
    @venues = @q.result(distinct: true).includes(:bookmarks, :neighborhood,
                                                 :specialties, :fans).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(address_latitude: nil)) do |venue, marker|
      marker.lat venue.address_latitude
      marker.lng venue.address_longitude
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @venue = Venue.new
  end

  def edit; end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      message = "Venue was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @venue, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    message = "Venue was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to venues_url, notice: message
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :neighborhood_id)
  end
end
