class RemoveColumFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :turn_id
  end
end
