class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end
  
  def popular
    redirect_to '/popular/events/'
  end
  
  def popular_tags
    redirect_to '/popular/tags/'
  end
end
