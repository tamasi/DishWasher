class CreateUserOrganizations < ActiveRecord::Migration
  def change
    create_table :user_organizations do |t|

      t.timestamps
    end
  end
end
