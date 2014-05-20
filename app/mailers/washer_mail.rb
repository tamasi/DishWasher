class WasherMail < ActionMailer::Base

	def turn_mail(user, organization)
		@userMail = user
		@organization = organization
		mail(to: @userMail.email, subject: "Your turn to wash is. May the Force be with you")
	end
end