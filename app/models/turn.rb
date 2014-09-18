class Turn < ActiveRecord::Base
	belongs_to :user

  scope :for_organization, -> (organization) { joins(:user).where('users.organization_id = ?', organization.id) }
  scope :from_users, -> (user_ids) { where(user_id: user_ids) }
  scope :greater_turn_date_than, -> (date) { where('date_turn >= ?', date) }

  def self.date_turn_in_the_past(date)
    if date.saturday? or date.sunday?
      date = date-2
    end
    date
  end

  def self.from_date
    date = date_turn_in_the_past(Time.now.to_date-2)
    where('date_turn >= ?', date).limit(7).order(date_turn: :asc)
  end

  def self.past_days(days_count = 2)
    where('turns.date_turn < ?', Date.current).order(date_turn: :desc).limit(days_count)
  end

  def self.from_current_date
    date = Time.now.to_date
    if date.saturday?
      date += 2
    elsif date.sunday?
      date += 1
    end
    where('turns.date_turn >= ?', date).limit(10).order(date_turn: :asc)
  end

  def self.from_chose_date(start_date = Time.now.to_date, end_date = Time.now.to_date+1)
    where('turns.date_turn >= ?', start_date).where('turns.date_turn <= ?', end_date)
  end

  def self.this_date(this_date = Time.now.to_date)
    where(date_turn: this_date)
  end

  def self.next_turn_to_rotate(date = Time.now.to_date)
    where("date_turn >= ?", date).order(date_turn: :asc)
  end
end
