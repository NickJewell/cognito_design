class WatchersController < ApplicationController
    before_filter :load_event

    def create
      @watcher = @event.watchers.build(     event: @event, 
                                            user: current_user, 
                                            attendee_flag: 'N', 
                                            watch_flag: 'Y', 
                                            created_at: Time.now, 
                                            updated_at: Time.now ) 
       if @watcher.save
          redirect_to event_path(@event.id), :flash => { :success => "Event Watch Added"}
        else
          render 'events'
        end

    end

    def index
      @title = "All Watchers"
      @watchers = Watcher.all
    end


    def destroy
       @watcher = Watcher.find(:first, :conditions => ["event_id = ? and user_id = ?", @event.id, current_user.id])
       @watcher.destroy
       redirect_to event_path(@event.id), :flash => { :error => "Event Watch Removed"}
     end


    def show
      @watcher = Watcher.find(:first, :conditions => ["event_id = ? and user_id = ?", @event.id, current_user.id])
    end


    private 

    def load_event
      @event = Event.find( params[:id] )
    end

  end
