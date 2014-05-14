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

end
