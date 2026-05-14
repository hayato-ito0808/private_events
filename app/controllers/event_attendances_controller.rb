class EventAttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])

    @event_attendance =
      current_user.event_attendances.build(
        event_id: @event.id
      )

    if @event_attendance.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

end