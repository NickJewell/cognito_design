class EventsController < ApplicationController
  before_filter :authenticate
  
  def index
    @title = "All Events"
    @search = Event.search(params[:search])
    @events = @search.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @events             = Event.find(params[:id])
    @eventresources     = EventResource.find_by_event_id(params[:id])
    @resources          = Resource.find(@eventresources.resource_id)
  end
  
  def create
    #Need to pick up the current user for the user_host_id
    @event = Event.new(params[:event])
    @event.user_host_id = current_user.id
    #@event = current_user.event.build(params[:event])
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

  def resources
    @resources = Resource.find(params[:id])
  end


end
