class AddMissedToTurn < ActiveRecord::Migration
  def change
    add_column :turns, :miss, :boolean
  end
end
