class ChangeNameOfReoccurrenceId < ActiveRecord::Migration
  def self.up
    rename_column :events, :reoccurence_id, :reoccurrence_id
  end

  def self.down
    rename_column :events, :reoccurrence_id, :reoccurence_id
  end
end
