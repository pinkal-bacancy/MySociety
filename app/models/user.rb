class User < ApplicationRecord
	belongs_to :society
	has_many :messages
  has_one :status
  has_many :complaints
  has_many :notifications,foreign_key: :recipient_id
  rolify

  # after_create :give_role
  # def give_role
  #   binding.pry
  #   if self.roles.empty?
  #         binding.pry

  #     self.add_role "member"

  #    end
  # end	
  mount_uploader :image, ImageUploader

  # rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,:gender,:dob, presence: true  	
end
