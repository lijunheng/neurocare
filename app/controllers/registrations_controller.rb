class RegistrationsController < ApplicationController
  before_action :signed_in_user

  def create
    @event = Event.find(params[:registration][:signed_up_event_id])
    @event.signup!(current_user)
    redirect_to @event
  end

  def destroy
    @event = Registration.find(params[:id]).signed_up_event
    @event.unsignup!(current_user)
    redirect_to @event
  end
end