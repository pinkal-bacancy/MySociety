class Maintainance < ApplicationRecord
  belongs_to :society
  has_many :status, :dependent => :destroy
end
