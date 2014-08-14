namespace :load_dates do

  	desc "Load Dates in table turn_to_wash"
  	task load_year: :environment do
  		date = Time.now
  		count = date.yday
  		while count < 365
  			@turn = TurnToWash.new
  			@turn.dateturn = date.to_date
  			@turn.datename = date.strftime("%A")
  			@turn.is_weekend = true if date.strftime("%A") == "Saturday" or date.strftime("%A") == "Sunday" 
  			@turn.save
  			count += 1
  			date = date.to_date + 1
  		end
  	end

    
    desc "Assign Turn to Wash to a soldier"
    task assign_turn: :environment do
      @team = User.where(organization_id: 3)
      @dayturn = TurnToWash.todayid
      @lastday = TurnToWash.last
      c = @dayturn.id
      while @dayturn.id != 2082
        @team.shuffle
        @team.each do |soldier|
          @us_turn = UserTurn.new
          @us_turn.user_id = soldier.id
          @us_turn.turn_to_wash_id = c

          @us_turn.save
        end
        @dayturn.id += 1
        c += 1
      end
    end

    desc "Assign a Order Number to user from organization"
    task assign_order: :environment do
      @team = User.where(organization_id: 1)
      @team.each_with_index do | user, index |
        user.order_number = index
        user.save
      end
    end
end
