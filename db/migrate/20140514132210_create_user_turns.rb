class CreateUserTurns < ActiveRecord::Migration
  def change
    create_table :user_turns do |t|
      t.integer :user_id
      t.integer :turn_to_wash_id

      t.timestamps
    end
  end
end
