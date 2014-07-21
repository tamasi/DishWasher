class Turn < ActiveRecord::Base
	belongs_to :user

  scope :from_date, -> { where('date_turn >= ?', Time.now.to_date-2) }

  #scope :from_date, -> { where('date_turn >= ?', Time.now.strftime("%Y-%m-%d")) }
  scope :to_date, ->(f) { where('date_turn <= ?', f) }
end
