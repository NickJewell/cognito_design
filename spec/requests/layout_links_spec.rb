require 'spec_helper'

describe "LayoutLinks" do

  it  "should have a Home page at '/' " do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have a SignUp page at '/signup'" do
    get '/contact'
    response.should have_selector('title', :content => "Sign Up")
  end

end
