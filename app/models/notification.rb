class Notification < ApplicationRecord
	belongs_to :recipient, class_name:"User"
	belongs_to :actor,class_name:"User"
	belongs_to :notifiable,polymorphic: true

	#scope :unread, ->{where(read_at:nil)} 
	#scope :content, ->{where(action:"how are you???").where(actor_id:8)}
	def self.unread
      Notification.where(read_at:nil)
    end
    def self.content
       Notification.where(action:"how are you???").where(actor_id:9)
    end
end
