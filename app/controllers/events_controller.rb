class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    # Creates even through user
    @event = current_user.events.build(event_params)

      if @event.save
          redirect_to root_url
      else
          render :new, status: :unprocessable_entity
      end
  end

  private

  def event_params
    params.require(:event).permit(:title,:date,:location,:description)
  end
end
