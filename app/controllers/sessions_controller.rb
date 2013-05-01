class SessionsController < ApplicationController
  def index
  end

  def login
  	user = User.where('email = ? and password = ?', params[:email], params[:password]).first!
  	session[:user_id] = user.id
  	redirect_to :root
  rescue ActiveRecord::RecordNotFound
  	flash[:notice] = "Wrong Email or Password"
  	redirect_to :login
  end

  def new
  end

  def create
  	user = User.create(params[:user])
  	session[:user_id] = user.id
  	redirect_to :root
  end
end
