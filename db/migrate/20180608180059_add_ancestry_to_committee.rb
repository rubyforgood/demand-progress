class AddAncestryToCommittee < ActiveRecord::Migration[5.2]
  def change
    add_column :committees, :ancestry, :string
    add_index :committees, :ancestry
  end
end
