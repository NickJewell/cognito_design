class EventsController < ApplicationController
  
  def index
    @title = "All Events"
    unless params[:low] && params[:high]
      @events = Event.all
    else
      @events = Event.filter(params[:low], params[:high])
    end
    
    @duration_range = Event.low_high_durations
  end
  
  def show
    @title = "All Events - Show"
    # Deliberately blank for now...
  end
  

end
