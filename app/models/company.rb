class Company < ActiveRecord::Base
	before_create :set_date
	
	private
		def set_date
		  self.join_date = Time.now
		end
end
