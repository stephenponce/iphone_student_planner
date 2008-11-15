class RemoveUnnecessaryColumns < ActiveRecord::Migration
  def self.up
    remove_column :events, :date_end
    remove_column :events, :date_start
    
  end

  def self.down
    add_column :events, :date_end
    add_column :events, :date_start
  end
end
