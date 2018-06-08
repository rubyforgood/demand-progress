class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :topic
      t.datetime :occurs_at
      t.string :location

      t.timestamps
    end
  end
end
