namespace :notification_turn do
	
		desc "Send notification about turn to dish washes in organization"
		task send: :environment do
			Turn.where(date_turn: 1.day.from_now.to_date).each do |turn|
        user         = turn.user
        organization = turn.user.organization
        puts user
        puts organization
				::WasherMail.turn_mail(user, organization)
			end
		end
end