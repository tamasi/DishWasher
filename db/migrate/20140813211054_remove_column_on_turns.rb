class RemoveColumnOnTurns < ActiveRecord::Migration
  def change
    remove_columns :turns, :miss
    remove_columns :turns, :order_number
  end
end
