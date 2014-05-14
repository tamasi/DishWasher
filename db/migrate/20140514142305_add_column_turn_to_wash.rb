class AddColumnTurnToWash < ActiveRecord::Migration
  def change
    add_column :turn_to_washes, :is_weekend, :boolean
    add_column :turn_to_washes, :is_holiday, :boolean
  end
end
