class EventsController < ApplicationController
  def index
    @events = Event.order(:start_date)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :venue_id, :name, :cancelled)
  end
end
