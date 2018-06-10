class ChangeCommiteesToOrganizations < ActiveRecord::Migration[5.2]
  def change
    rename_table "committees", "organizations"
  end
end
