class AddTurnIdToUser < ActiveRecord::Migration
  def up
    add_column :users, :turn_id, :string
  end

  def down
  	remove_column :users, :turn_id
  end
end
