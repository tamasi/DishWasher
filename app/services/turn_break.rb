class TurnBreak
  attr_reader :user_ask_for_break, :turn_to_change, :end_date

  def initialize(user_ask_for_break, turn_to_change, end_date)
    @user_ask_for_break = user_ask_for_break
    @turn_to_change     = turn_to_change
    @end_date           = end_date
  end

  def perform
    turns_break = Turn.from_users(user_ask_for_break.id).from_chose_date(turn_to_change, end_date)

    turns_break.each_with_index do |turn, index|
      next_index     = index + 1
      turn_to_change = turn.date_turn
      empty_day      = turn.date_turn
      puts next_index
      puts turn_to_change
      puts turns_break[next_index].date_turn
      turn.destroy
      while empty_day <= turns_break[next_index].date_turn
        puts turn_to_change
        next_workable_day
        puts turn_to_change
        next_turn_to_rotate = Turn.for_organization(user_ask_for_break.organization).this_date(turn_to_change)
        if next_turn_to_rotate
          next_turn_to_rotate.first.update(date_turn: empty_day)
        end
        empty_day = turn_to_change
      end
    end

  end

  private
    def next_workable_day
      if turn_to_change.friday?
        @turn_to_change += 3
      else
        @turn_to_change += 1
      end
      puts turn_to_change
    end
end