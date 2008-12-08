class AddReoccursUntilToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :reoccurs_until, :date
  end

  def self.down
    remove_column :events, :reoccurs_until
  end
end
