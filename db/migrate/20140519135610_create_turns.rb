class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.date :date_turn

      t.timestamps
    end
  end
end
