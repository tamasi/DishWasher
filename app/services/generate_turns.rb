class GenerateTurns
  attr_reader :team, :start_date

  def initialize(team, start_date)
    @team = team
    @start_date = start_date-2
  end

  def perform
    last_day_of_year = Time.new.end_of_year.to_date

    while start_date <= last_day_of_year
      team.each do |member|
        Turn.create(user_id: member.id, date_turn: start_date)
        get_next_workable_day
      end
    end

  end

  private

    def get_next_workable_day
      if start_date.friday?
        @start_date += 3
      else
        @start_date += 1
      end
    end

end