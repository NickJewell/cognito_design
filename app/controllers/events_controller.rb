class EventsController < ApplicationController
  
  def index
    @title = "All Events"
    @events = Event.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @title = "All Events - Show"
    # Deliberately blank for now...
  end
  

end
