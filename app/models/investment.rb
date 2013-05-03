class Investment < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  attr_accessible :capital
end
