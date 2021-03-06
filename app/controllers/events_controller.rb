class EventsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :destroy]

  def new
    @event = Event.new
  end


  def create
    session[:id] = 0
    session[:v] = "Public"
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to welcome_path
      flash[:notice] = "Event has been successfully created"
    else
      render 'new', notice: @event.errors.full_messages.first
    end
  end

  def show
    @comments = @event.comments
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to welcome_path }
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :start_time, :address, :description, :group_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
