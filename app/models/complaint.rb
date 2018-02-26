class Complaint < ApplicationRecord
  belongs_to :user
  enum status: ["pending","solved"] 	
end
