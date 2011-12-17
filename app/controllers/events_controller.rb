class EventsController < ApplicationController
  before_filter :authenticate
  helper_method :sort_column, :sort_direction

  def tags 
      @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{params[:q]}%") 
      respond_to do |format|
        format.json { render :json => @tags.map{|t| {:id => t.name, :name => t.name }}}
      end
  end
  
  def index
    require 'will_paginate/array'
    @title = "All Events"
    @user = User.find(current_user.id)
    @search = Event.search(params[:search])
    @search_sort = @search.order(sort_column + ' ' + sort_direction)
    @events = @search_sort.paginate(:page => params[:page], :per_page => 10)
    
    @scroller = Event.all(:order => "session_datetime DESC",
                          :limit => 50)
    
  end
  
  def tagsearch
    require 'will_paginate/array'
    @title = "Tag Searched Events"
    @search = Event.tagged_with(params[:tags])
    @events = @search.paginate(:page => params[:page], :per_page => 10)
  end
  
  def vote_check(ev_id)
    @user = User.find(current_user.id)
    @event = Event.find(ev_id)
    @user.voted_for? @event
  end
  
  def show
    @events             = Event.find(params[:id])
    #@eventresources     = EventResource.find_by_event_id(params[:id])
    #@resources          = Resource.find(@eventresources.resource_id)
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
  
  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path, :flash => { :error => "Event Destroyed."}
  end

  def resources
    @resources = Event.find(params[:id]).resources
    render 'resources/show' 
  end
  
  def hosting
    require 'will_paginate/array'
    @title = "Hosting"
    @event = Event.find_all_by_user_host_id(current_user.id)
    @events = @event.paginate(:page => params[:page], :per_page => 10)
    render 'event_hosting'
  end
  
  def watching
    require 'will_paginate/array'
    @title = "Watching"
    conditions = ['watchers.user_id = ?', current_user.id]
    @event = Event.joins(:watchers).find(:all, :conditions => conditions)
    @events = @event.paginate(:page => params[:page], :per_page => 10)
    render 'event_watching'
  end
  
  def attending
    require 'will_paginate/array'
    @title = "Attending"
    conditions = ['attendees.user_id = ?', current_user.id]
    @event = Event.joins(:attendees).find(:all, :conditions => conditions)
    @events = @event.paginate(:page => params[:page], :per_page => 10)
    render 'event_attending'
  end
    
  def popularevents
    @title = "Popular Events"
    @top_events = Vote.find(:all,
                            :select => 'events.id, events.title, count(votes.id) as vote_count',
                            :joins  => 'INNER JOIN events on votes.voteable_id = events.id',
                            :group  => 'events.id, events.title',
                            :limit  => 10,
                            :order  => 'count(votes.id) DESC',
                            :conditions => ["vote = ?", true])
  end
  
  def popular_tags
    @title = "Popular Tags"
    # SQLite version
    #@top_tags =   Tag.find( :all,
    #                        :select => 'tags.name, count(tags.id) as tag_count',
    #                        :joins  => 'INNER JOIN taggings on tags.id = taggings.tag_id, events on taggings.taggable_id = events.id',
    #                        :group  => 'tags.name',
    #                        :limit  => 10,
    #                        :order  => 'count(tags.id) DESC')
    # Postgres version
    @top_tags =   Tag.find( :all,
                            :select => 'tags.name, count(tags.id) as tag_count',
                            :joins  => ',taggings, events',
                            :group  => 'tags.name',
                            :limit  => 10,
                            :order  =>'count(tags.id) DESC', 
                            :conditions => 'tags.id=taggings.tag_id and taggings.taggable_id = events.id')
                            
  end
  
  def popular_users
    @title = "Popular Users"

    @top_users = Event.find(:all,
                            :select => 'user_host_id, count(votes.id) as vote_count',
                            :joins  => 'INNER JOIN votes on events.id = votes.voteable_id',
                            :group  => 'user_host_id',
                            :limit  => 10,
                            :order  => 'count(votes.id) DESC',
                            :conditions => ["vote = ?", true])

                            
  end
  
  def tagsearch_results
    require 'will_paginate/array'
    #@search = Event.metasearch({:title_or_content_or_tag_taggings_tag_name_contains => params[:search]})
   
    case ActiveRecord::Base.connection.adapter_name
    when 'SQLite'
      @search = Event.find_by_sql(["SELECT events.* from events 
                                    WHERE  
                                      (events.title LIKE ? 
                                       OR events.content LIKE ?)
                                    UNION
                                    SELECT events.* from events 
                                    INNER JOIN taggings on events.id= taggings.taggable_id
                                    INNER JOIN tags ON taggings.tag_id = tags.id 
                                    WHERE taggings.taggable_type = 'Event' 
                                     and tags.name LIKE ?", 
                                    "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"])
    when 'PostgreSQL'
      @search = Event.find_by_sql(["SELECT events.* from events 
                                    WHERE  
                                      (events.title ILIKE ? 
                                       OR events.content ILIKE ?)
                                    UNION
                                    SELECT events.* from events 
                                    INNER JOIN taggings on events.id= taggings.taggable_id
                                    INNER JOIN tags ON taggings.tag_id = tags.id 
                                    WHERE taggings.taggable_type = 'Event' 
                                     and tags.name ILIKE ?", 
                                    "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"])
    else
      raise 'Migration not implemented for this DB adapter'
    end
    
                                  
    @events = @search.paginate(:page => params[:page], :per_page => 10)
    render 'index'
    
  end
  
  private
  def sort_column
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
end
