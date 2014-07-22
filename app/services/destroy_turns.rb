class DestroyTurns
  attr_reader :team, :start_date

  def initialize(team, start_date)
    @team = team
    @start_date = start_date
  end

  def perform
    user_ids = team.map(&:id)
    turns = Turn.from_users(user_ids).greater_turn_date_than(start_date)
    turns.destroy_all
  end

end