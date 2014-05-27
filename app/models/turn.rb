class Turn < ActiveRecord::Base
	belongs_to :user

  scope :from_date, ->(f) { where('date_turn >= ?', f) }
  scope :to_date, ->(f) { where('date_turn <= ?', f) }
end
