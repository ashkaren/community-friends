class EventsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :destroy]

  # GET /events
  # GET /events.json
  def index
    if current_user.admin?
      admin_view
    else
      user_view
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comments = @event.comments
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def admin_view
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  def user_view
    @comments = @event.comments
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to welcome_path
    else
      render 'new', notice: @event.errors.full_messages.first
    end
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
    params.require(:event).permit(:name, :when)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end