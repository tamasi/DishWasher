class TurnToWash < ActiveRecord::Base
	has_many :user_turn
	has_many :users, through: :user_turn
end
