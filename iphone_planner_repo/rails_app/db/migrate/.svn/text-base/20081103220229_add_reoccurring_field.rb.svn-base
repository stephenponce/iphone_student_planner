class AddReoccurringField < ActiveRecord::Migration
  def self.up
    add_column :events, :reoccuring_event, :boolean
    add_column :events, :reoccurs_on, :string
  end

  def self.down
    drop_column :events, :reoccuring_event
    drop_column :events, :reoccurs_on
  end
end
