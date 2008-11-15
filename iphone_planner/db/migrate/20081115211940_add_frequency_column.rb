class AddFrequencyColumn < ActiveRecord::Migration
  def self.up
    add_column :events, :frequency, :string
  end

  def self.down
    remove_column :events, :frequency
  end
end
