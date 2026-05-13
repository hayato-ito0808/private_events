class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end
end