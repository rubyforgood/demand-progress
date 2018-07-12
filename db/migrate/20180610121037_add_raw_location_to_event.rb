class AddRawLocationToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :raw_location, :string
  end
end
