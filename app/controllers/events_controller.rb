class EventsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @current_events = Event.where(starts_at: Time.now.midnight..(Time.now.midnight + 1.day))
    
    @generic_events = Event.where('ends_at >= :today_date', :today_date => Time.now).where(
      "valid_sunday = ? OR valid_monday = ? OR valid_tuesday = ? OR valid_wednesday = ? OR valid_thursday = ? OR valid_friday = ? OR valid_saturday = ?",
      true, true, true, true, true, true, true
    )

    @upcoming_events = Event.where(starts_at: (Time.now.midnight + 1.day)..(Time.now.midnight + 7.days))
    
    @day_generic_events = @generic_events.where("valid_#{Time.now.strftime('%A').downcase}" => true)
    @current_events = @current_events + @day_generic_events
  end
  
  def show
  end

  def new
    @event = Event.new(:starts_at => Time.now, :ends_at => Time.now + 1.hour)
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path }
    end
  end
  
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :starts_at, :ends_at,
        :valid_sunday, :valid_monday, :valid_tuesday, :valid_wednesday, :valid_thursday, :valid_friday, :valid_saturday)
    end
  
  
end
