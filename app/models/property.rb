class Property < ActiveRecord::Base
  attr_accessible :address, :available_value, :city, :client_irr, :country_code, :description, :irr, :purchase_value, :state
  has_many :investments
end
