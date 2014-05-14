class UserTurn < ActiveRecord::Base
	belongs_to :user
	belongs_to :turn_to_wash
end
