class ModifyDurationColumn < ActiveRecord::Migration
  def self.up
    change_column :events, :duration, :integer
  end

  def self.down
    change_column :events, :duration, :datetime
  end
end
