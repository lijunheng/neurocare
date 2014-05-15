class EventsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :edit, :update, :new]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.create(event_params)
    @event.user_id = current_user.id
  	if @event.save
  		flash[:success] = "Event created!"
  		redirect_to @event
  	else
  		render 'new'
  	end
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def show
  	@event = Event.find(params[:id])
    @user = current_user
    @users = @event.signed_up_users.paginate(page: params[:page])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated!"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def index
    @events = Event.paginate(page: params[:page]).search(params[:search])
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event removed"
    redirect_to events_path
  end

  def signed_up_users
    @title = "Participants"
    @event = Event.find(params[:id])
    @users = @event.signed_up_users.paginate(page: params[:page])
    render 'show_reg'
  end

  private

  	def event_params
  		params.require(:event).permit(:name, :content, :date, :location)
  	end

    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @event = Event.find(params[:id])
      redirect_to(root_url) unless current_user?(User.find(@event.user_id))
    end
end
