class AttendeesController < ApplicationController
  before_filter :load_event
  
  def create
    @attendee = @event.attendees.build(   event: @event, 
                                          user: current_user, 
                                          attendee_flag: 'Y', 
                                          watch_flag: 'N', 
                                          created_at: Time.now, 
                                          updated_at: Time.now ) 
     if @attendee.save
        redirect_to events_path, :flash => { :success => "Attendee Added"}
      else
        render 'events'
      end

  end
  
  def index
    @title = "All Attendees"
    @attendees = Attendee.all
  end
  
  
  def destroy
     @attendee = Attendee.find(:first, :conditions => ["event_id = ? and user_id = ?", @event.id, current_user.id])
     @attendee.destroy
     redirect_to events_path, :flash => { :error => "Attendee Removed"}
   end

  
  def show
    @attendee = Attendee.find(:first, :conditions => ["event_id = ? and user_id = ?", @event.id, current_user.id])
  end
  
  
  private 
  
  def load_event
    @event = Event.find( params[:id] )
  end
  
end
