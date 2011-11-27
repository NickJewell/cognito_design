class ResourcesController < ApplicationController
  def index
    @title = "All Resources"
    @resources = Resource.all
  end
  
  def create
    @event = Event.find(params[:id])
    @resource = @event.resources.new(params[:id])
    
    #@resource = Resource.new(params[:resource])
    @resource.user_id = current_user.id
    if @resource.save
      redirect_to @resource, :flash => { :success => "Resource Created! "}
    else    
      redirect_to 'index', :flash => { :error => "Something's Wrong!"}
    end
  end
  
  def new
    @title = "Create Resource"
    @resource = Resource.new
  end
  
  def show
    @resources = Resource.find(params[:id])
  end
  
end
