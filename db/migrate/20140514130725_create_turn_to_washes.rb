class CreateTurnToWashes < ActiveRecord::Migration
  def change
    create_table :turn_to_washes do |t|
      t.date :dateturn
      t.string :datename

      t.timestamps
    end
  end
end
