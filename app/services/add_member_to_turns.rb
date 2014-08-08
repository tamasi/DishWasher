class AddMemberToTurns
  attr_reader :team

  def initialize(team)
    #el @team debe ser calculado con el scope from_organization_desc
    @team = team
  end

  def perform
    new_member         = team.first
    turns_organization = Turn.for_organization(new_member.organization).order(date_turn: :asc)
    team_count         = team.count
    (0..turns_organization.length - 1).step(team_count) do |index|
      
    end
  end
end