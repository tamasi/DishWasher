class Turn < ActiveRecord::Base
	belongs_to :user

  scope :for_organization, -> (organization) { joins(:user).where('users.organization_id = ?', organization.id).from_date.order(date_turn: :asc) }
  scope :from_users, -> (user_ids) { where(user_id: user_ids)}
  scope :greater_turn_date_than, -> (date) { where('date_turn >= ?', date) }

  def self.date_turn_in_the_past(date)
    if date.strftime("%a") == "Sat" or "Sun"
      date = date-2
    end
    date
  end

  def self.from_date
    date = date_turn_in_the_past(Time.now.to_date-2)
    where('date_turn >= ?', date).limit(7)
  end

  def self.past_days(days_count = 2)
    where('turns.date_turn < ?', Date.current).order(date_turn: :desc).limit(days_count)
  end

end
