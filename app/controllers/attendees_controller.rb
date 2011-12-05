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
  
  def add_vote
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    if(@user.voted_for? @event )
      redirect_to events_path, :flash => { :error => "Vote Already Cast"}
    else
      @user.vote_exclusively_for(@event)
      redirect_to events_path, :flash => { :success => "Vote Added - Thanks!"}
   end
  end
  
  def remove_vote
    @event = Event.find(params[:id])
    @user = User.find(current_user.id)
    if(@event.votes_for > 0)
        @user.vote_exclusively_against(@event)
       redirect_to events_path, :flash => { :error => "Vote Removed"}
    else
      redirect_to events_path, :flash => { :error => "Something's Wrong - can't remove vote?!"}
    end
  end
  
  private 
  
  def load_event
    @event = Event.find( params[:id] )
  end
  

  
end
