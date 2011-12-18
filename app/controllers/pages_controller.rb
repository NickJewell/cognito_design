class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @scroller = Event.all(:order => "created_at DESC",
                            :limit => 50)
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
  
  def test
    @title = "Hello"
  end
end
