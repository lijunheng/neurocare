class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to @event
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  private

  	def event_params
  		params.require(:event).permit(:name, :content, :date, :location)
  	end
end
