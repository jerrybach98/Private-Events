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
    @event = current_user.events.new(post_params)

      if @event.save
          redirect_to root_url
      else
          render :new, status: :unprocessable_entity
      end
  end

  private

  def post_params
    params.require(:event).permit(:title,:body)
  end
end
