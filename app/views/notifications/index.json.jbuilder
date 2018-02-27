json.array! @notifications do 	|notification|
	json.actor notification.actor.name
	json.recipient notification.recipient.name
	json.action notification.action
	json.notifiable do
		json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	end
	#json.url root_path(notification.notifiable.message,anchor: dom_id(notification.notifiable))
   # json.url root_path
end