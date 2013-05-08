class SessionsController < ApplicationController
  def index
  	@style_sheets = 'sessions'
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
  	@style_sheets = 'sessions'
  end

  def create
  	params[:user][:account_balance] = 0
  	params[:user][:account_invested] = 0
  	params[:user][:account_total] = 0
  	user = User.where('lower(email) = lower(?)', params[:user][:email]).first_or_initialize(params[:user])
  	if user.new_record?
  		user.save
  		session[:user_id] = user.id
  		redirect_to :root
  	else
  		flash[:notice] = "Email already exists"
  		redirect_to :new_user
  	end
  end
end
