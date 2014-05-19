class AddColumToTurn < ActiveRecord::Migration
  def up
    add_column :turns, :user_id, :string
  end

  def down
  	remove_column :turns, :user_id
  end
end
