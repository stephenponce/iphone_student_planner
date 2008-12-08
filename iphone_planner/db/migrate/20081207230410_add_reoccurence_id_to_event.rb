class AddReoccurenceIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :reoccurrence_id, :integer
  end

  def self.down
    remove_column :events, :reoccurrence_id
  end
end
