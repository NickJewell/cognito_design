class EventsController < ApplicationController
  
  def index
    @title = "All Events"
    @events = Event.paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @title = "All Events - Show"
    # Deliberately blank for now...
    @events             = Event.find(params[:id])
    @title              = @events.title
    @channels           = Channel.find(:all, :order => "id")
    @difficulties       = Difficulty.find(:all, :order => "id")
    @sizes              = Size.find(:all, :order => "id")
    @statuses           = Status.find(:all, :order => "id")
    @timezones          = Timezone.find(:all, :order => "id")
  end
  

end
