class TurnBreak
  attr_reader :user_ask_for_break, :start_date, :end_date

  def initialize(user_ask_for_break, start_date, end_date)
    @user_ask_for_break = user_ask_for_break
    @start_date         = start_date
    @end_date           = end_date
  end

  def perform
    turns_break = Turn.from_users(user_ask_for_break.id).from_chose_date(start_date, end_date)

    turns_break.each_with_index do |turn_break, index|
      next_index = index +1
      turn_change = turn_break.date_turn
      turn_break.destroy
      while turns_break[next_index] != nil && turn_change <= turns_break[next_index].date_turn
        next_turn_to_rotate = Turn.find_by(date_turn: turn_change)
        next_turn_to_rotate.update(date_turn: turn_change)
        next_workable_day(turn_change)
      end
    end

    puts 'fin'
  end

  private
    def next_workable_day(turn_change)
      if turn_change.friday?
        @turn_change += 3
      else
        @turn_change += 1
      end
    end
end