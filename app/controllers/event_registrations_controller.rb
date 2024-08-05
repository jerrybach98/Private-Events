class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def update
    @event = Event.find(params[:event_id])
    current_user.attended_events << @event
    flash[:notice] = "You signed up!"
    redirect_to event_path(@event)
  end
end