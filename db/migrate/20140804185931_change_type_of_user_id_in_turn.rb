class ChangeTypeOfUserIdInTurn < ActiveRecord::Migration
  def up
    change_column :turns, :user_id, 'integer USING CAST(user_id AS integer)'
  end

  def down
    change_column :turns, :user_id, :string
  end
end
