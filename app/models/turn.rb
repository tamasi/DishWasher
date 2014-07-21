class Turn < ActiveRecord::Base
	belongs_to :user

  scope :from_date, -> { where('date_turn >= ?', date_turn_in_the_past(Time.now.to_date-2)).limit 7 }

  #scope :from_date, -> { where('date_turn >= ?', Time.now.strftime("%Y-%m-%d")) }
  scope :to_date, ->(f) { where('date_turn <= ?', f) }


  def self.date_turn_in_the_past(date)
    if date.strftime("%a") == "Sat" or "Sun"
      date = date-2
    end
    return date
  end

end
