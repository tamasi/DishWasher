class AddMemberToTurns
  attr_reader :team

  def initialize(team)
    @team = team
  end

  def perform
    new_member               = User.from_organization_asc(team.first.organization).last
    last_turn                = Turn.for_organization(team.first.organization).from_current_date.last
    start_date_to_delete     = last_turn.date_turn+1
    complete_team            = User.from_organization(new_member.organization)
    start_date_to_regenerate = last_turn.date_turn+2
    DestroyTurns.new(team, start_date_to_delete).perform
    Turn.create(user_id: new_member.id, date_turn: last_turn.date_turn+1)
    GenerateTurns.new(complete_team, start_date_to_regenerate).perform
  end
end