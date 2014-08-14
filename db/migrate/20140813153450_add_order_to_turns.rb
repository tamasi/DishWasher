class AddOrderToTurns < ActiveRecord::Migration
  def up
    add_column :turns, :order_number, :integer, default: 0
    add_index :turns, :order_number
  end

  def down
    remove_column :turns, :order_number, :integer
  end
end
