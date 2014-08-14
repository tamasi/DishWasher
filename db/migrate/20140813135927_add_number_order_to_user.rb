class AddNumberOrderToUser < ActiveRecord::Migration
  def up
    add_column :users, :order_number, :integer
    add_index :users, :order_number
  end

  def down
    remove_column :users, :order_number, :integer
    remove_index :users, :order_number
  end
end
