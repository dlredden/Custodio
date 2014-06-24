class Company < ActiveRecord::Base
	has_many :diagrams
	has_many :servers

	before_create :set_date
	
	private
		def set_date
		  self.join_date = Time.now
		end
end
