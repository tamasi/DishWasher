class TurnBreak
  attr_reader :user_ask_for_break, :start_date, :end_date

  def initialize(user_ask_for_break, start_date, end_date)
    @user_ask_for_break = user_ask_for_break
    @start_date         = start_date
    @end_date           = end_date
  end

  def perform
    turns_break = Turn.from_users(user_ask_for_break.id).from_chose_date(start_date, end_date)

    turns_break.each do |date_break|
      turn_change = date_break.date_turn
    end
  end
end