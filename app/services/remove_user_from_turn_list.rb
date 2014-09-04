class RemoveUserFromTurnList
  attr_reader :user, :turn_to_change, :end_date

  def initialize(user, turn_to_change, end_date)
    @user           = user
    @turn_to_change = turn_to_change.to_date
    @end_date       = end_date.to_date
  end

  def perform
    turns_break = Turn.from_users(user.id).from_chose_date(turn_to_change, end_date)
    add         = Turn.from_users(user.id).from_chose_date(end_date, Time.new.end_of_year.to_date)
    if turns_break.size < 2
      if turns_break.first != add.first
        turns_break << add.first
      else
        turns_break << add[1]
      end
    end
    turns_break.each_with_index do |turn, index|
      next_index     = index + 1
      turn_to_change = turn.date_turn
      empty_day      = turn.date_turn
      if turns_break[next_index] != nil
        turn.destroy
        while empty_day <= turns_break[next_index].date_turn
          next_workable_day
          next_turn_to_rotate = Turn.for_organization(user.organization).this_date(@turn_to_change)
          if next_turn_to_rotate.size != 0
            next_turn_to_rotate.first.update(date_turn: empty_day)
          end
          empty_day = @turn_to_change
        end
      end
    end

  end

  private
    def next_workable_day
      if turn_to_change.to_date.friday?
        @turn_to_change += 3
      else
        @turn_to_change += 1
      end
    end
end