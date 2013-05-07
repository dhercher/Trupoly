class UsersController < ApplicationController
  
  before_filter :require_user

  def show
  	@style_sheets = 'users'
  	@user = User.find(session[:user_id])

  rescue ActiveRecord::RecordNotFound
  	flash[:error] = "An Error Occurred, Please Login Again"
  	session[:user_id] = nil
  	redirect_to :login
  end

  def settings
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "Logout Successful"
  	redirect_to :login
  end

  private
  def require_user
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to :login
    end
    @admin = User.find(session[:user_id]).is_admin?
  end
end
