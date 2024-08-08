class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end
  
  def new
    @event = Event.new
  end

  def create
    # Creates event through user
    @event = current_user.events.build(event_params)

      if @event.save
          flash[:success] = "Great! Your event has been created!"
          redirect_to event_path(@event.id)
      else
          render :new, status: :unprocessable_entity
      end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:title,:date,:location,:description)
  end
end
