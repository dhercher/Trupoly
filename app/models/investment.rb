class Investment < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  attr_accessible :capital
  attr_accessible :user_id, :property_id
end
