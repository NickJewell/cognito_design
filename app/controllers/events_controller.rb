class EventsController < ApplicationController
  
  def index
    @title = "All Events"
    @events = Event.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @events             = Event.find(params[:id])
  end
  
  def create
    #Need to pick up the current user for the user_host_id
    @current_user = current_user
    @event = Event.new(params[:event])
    
    if @event.save
      redirect_to @event, :flash => { :success => "Event Created! "}
    else    
      @title = "Something's Wrong"
      render 'index'
    end
  end
  
  def new
    @title = "Create Event"
    @event = Event.new
    @channels           = Channel.find(:all, :order => "id")
    @difficulties       = Difficulty.find(:all, :order => "id")
    @sizes              = Size.find(:all, :order => "id")
    @statuses           = Status.find(:all, :order => "id")
    @timezones          = Timezone.find(:all, :order => "id")
  end
  
  def edit
    @title = "Edit User"
    @event = Event.find(params[:id])
    @channels           = Channel.find(:all, :order => "id")
    @difficulties       = Difficulty.find(:all, :order => "id")
    @sizes              = Size.find(:all, :order => "id")
    @statuses           = Status.find(:all, :order => "id")
    @timezones          = Timezone.find(:all, :order => "id")
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, :flash => { :success => "Event Updated"}
    else
      
      @title = "Edit Event"
      render 'edit'  
    end
  end

end
