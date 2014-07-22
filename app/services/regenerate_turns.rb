class RegenerateTurns
  attr_reader :team, :start_date

  def initialize
    @team = team
    @start_date = start_date
  end

  def perform
    ::DestroyTurns.new(team, start_date).perform
    ::GenerateTurns.new(team, start_date).perform
  end
end