class Status < ApplicationRecord
  belongs_to :user
  belongs_to :maintainance
  enum maintainance_status: ["pending","paid"]
end
