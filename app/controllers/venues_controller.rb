class VenuesController < ApplicationController
  def index
    @venues = Venue.order('LOWER(name)')
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      render :new
    end
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(venue_params)
      redirect_to @venue
    else
      render :edit
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name)
  end
end
