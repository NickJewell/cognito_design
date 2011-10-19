class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign Up"
    @user = User.new
  end
  
  def create
    @user = User.new (params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to the Sample App! "}
    else    
      @title = "Sign Up"
      render 'new'
    end
  end

  def edit
    @title = "Edit User"
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile Updated"}
    else
      
      @title = "Edit User"
      render 'edit'  
    end
  end
end

private
  def authenticate
    deny_access unless signed_in?
  end

