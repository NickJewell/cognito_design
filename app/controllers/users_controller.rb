class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy]

  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
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


def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User Destroyed"
  redirect_to users_path, :flash => { :success => "User Destroyed."}
end

end


private
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user) 
  end
  
  def admin_user
      redirect_to((root_path), :flash => { :error => "Cannot delete admin or yourself!"}) unless current_user.admin? && current_user?(@user)
  end

