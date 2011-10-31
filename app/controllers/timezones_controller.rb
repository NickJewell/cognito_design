class TimezonesController < ApplicationController
  def index
    @title = "All Timezones"
    @timezones = Timezone.paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @timezone = Timezone.find(params[:id])
  end
  
  def create
    @timezone = Timezone.new (params[:timezone])
  end
  
  def destroy
    @timezone = Timezone.find(params[:id])
    @timezone.destroy
  end


end
