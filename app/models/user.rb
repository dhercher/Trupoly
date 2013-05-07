class User < ActiveRecord::Base
  attr_accessible :account_balance, :account_invested, :account_total, :email, :first_name, :last_name, :password
  has_many :investments


  def IRR?
  	positions = Property.joins(:investments).where(:investments => {:user_id => self.id})
  	irr_sum = 0
  	cap_sum = 0
  	positions.each do |p|
  		irr_sum = irr_sum + p.client_irr * p.investments.capital
  		cap_sum = cap_sum + p.investments.capital
  	end
  	if irr_sum == 0
  		return 0
  	end
  	return (irr_sum/cap_sum)
  rescue ActiveRecord::RecordNotFound
  	return 0
  end

  def is_admin?()
  	return self.email =~ /^dhercher@colgate.edu$/ 
  end

end
