class User < ActiveRecord::Base
  attr_accessible :account_balance, :account_invested, :account_total, :email, :first_name, :last_name, :password
  has_many :investments
  accepts_nested_attributes_for :investments

  def IRR?
  	positions = Property.joins(:investments).where(:investments => {:user_id => self.id})
  	irr_sum = 0
  	cap_sum = 0
  	positions.each do |p|
  		p.investments.each do |q|
  			irr_sum = irr_sum + p.client_irr * q.capital
  			cap_sum = cap_sum + q.capital
  		end
  	end
  	if irr_sum == 0
  		return 0
  	end
  	return (irr_sum/cap_sum)
  rescue ActiveRecord::RecordNotFound
  	return 0
  end

  def is_admin?()
  	return self.email =~ /^(dhercher@colgate.edu|rsmith@colgate.edu)$/ 
  end

end
