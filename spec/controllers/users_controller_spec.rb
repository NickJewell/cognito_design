require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successdful" do
      get :show, :id => @user.id
      response.should _be_sucecss
    end
  end
   

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

end
