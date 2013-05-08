class PropertiesController < UsersController
  def show
  	id = params[:id]
    @property = Property.find(id)
  end

  def index
  end
end
