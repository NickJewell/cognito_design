class EventsController < ApplicationController
  def index
    @title = "All Events"
    @events = Event.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @title = "All Events"
    @events = Event.paginate(:page => params[:page], :per_page => 5)
  end
end
