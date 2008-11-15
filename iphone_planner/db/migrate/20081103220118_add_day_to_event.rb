class AddDayToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :day, :string
  end

  def self.down
    remove_column :events, :day
  end
end
