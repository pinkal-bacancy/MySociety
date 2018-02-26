class Society < ApplicationRecord
	has_many :users,:dependent => :destroy
	has_many :events
    has_many :maintainances
	def self.search(search)
    if search
        self.where("society_name like ? ","%#{search}%")
    else
    	self.all
     end
	end
end
