class AdminController < UsersController
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
end
