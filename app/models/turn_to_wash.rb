class TurnToWash < ActiveRecord::Base
	has_many :user_turn
	has_many :users, through: :user_turn

	scope :todayid, -> { find_by(dateturn: Time.now.to_date) }
	scope :day, -> (id) {find_by("id = ?", id)}

end
