class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  attr_accessible :investment
end
