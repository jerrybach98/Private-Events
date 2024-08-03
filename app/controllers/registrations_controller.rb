class RegistrationsController < ApplicationController
  before_action :require_login

  def update
    @event = Event.find(params[:event_id])
    current_user.attended_events << event
    flash[:notice] = "You signed up!"
    redirect_to event_path(@event)
  end

end
