class RotateTurnWithNextWasher
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def perform
    turn_to_rotate = Turn.from_users(@user.id).next_turn_to_rotate(Time.now.to_date).first
    next_turn      = Turn.next_turn_to_rotate(turn_to_rotate.date_turn)
    user_next_turn = next_turn[1].user

    turn_to_rotate.update(user_id: user_next_turn.id)
    next_turn[1].update(user_id: user.id)
  end
end