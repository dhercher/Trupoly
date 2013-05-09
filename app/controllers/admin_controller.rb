class AdminController < UsersController
  before_filter :require_admin

  def show
  	@users = User.order(:email)
  end

  def new_prop
  end

  def new
  	params[:property][:available_value] = params[:property][:purchase_value]
  	@property = Property.create!(params[:property])
  	@property = Property.where('lower(address) = lower(?) and lower(city) = lower(?) and lower(state) = lower(?) and lower(country_code) = lower(?)', params[:property][:address], params[:property][:city], params[:property][:state], params[:property][:country_code]).first_or_create(params[:property])
  	# @property = Property.where(:address => params[:property][:address], :city => params[:property][:city], :state => params[:property][:state], :country_code => params[:property][:country_code]).first_or_create(params[:property])
  	redirect_to proc {prop_url(@property.id)}
  end

  def investment
  	@user = params[:id]
  	@properties = Property.order(:city)
  end

  def invest
  	invest = Investment.where('user_id = ? and property_id = ?', params[:user_id], params[:property_id]).first_or_initialize(:capital => params[:property][:investment_value].to_f, :user_id => params[:user_id], :property_id => params[:property_id])
  	invest.user_id = params[:user_id].to_i
  	invest.property_id = params[:property_id].to_i
  	if invest.persisted?
  		invest.capital = invest.capital + params[:property][:investment_value].to_f
  	end
  	invest.save
  	user = User.find(params[:user_id])
  	user.account_total = user.account_total + params[:property][:investment_value].to_f
  	user.account_invested = user.account_invested + params[:property][:investment_value].to_f
  	user.save
  	redirect_to proc {show_user_url(params[:user_id])}
  end

  private
  def require_admin
    unless User.find(session[:user_id]).is_admin?
      flash[:error] = "You must be logged in to access this section"
      redirect_to :login
    end
  end
end
