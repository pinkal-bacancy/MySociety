class UserMailer < ApplicationMailer
	default from: 'pinkaldarji92@gmail.com'

	def maintainance_email(user)
		@user = user
   # @url  = 'http://example.com/login'
    mail to: [@user.email], subject: 'My Society Application'
  end	
end
