class AdminController < UsersController
  def show
  end

  def new_prop
  end

  def new
  	params[:property][:available_value] = params[:property][:purchase_value]
  	@property = Property.create!(params[:property])
  	@property = Property.where(:address => params[:property][:address], :city => params[:property][:city], :state => params[:property][:state], :country_code => params[:property][:country_code]).first_or_create(params[:property])
  	redirect_to proc {prop_url(@property.id)}
  end
end
