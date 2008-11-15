class AddTitleToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, 	:title, 	:string
    add_column :events, 	:date_start, 	:datetime
    add_column :events, 	:date_end, 	:datetime
    rename_column :events, 	:start_time, 	:time_start
    rename_column :events, 	:end_time, 	:time_end
  end

  def self.down
    remove_column :events, :title
    remove_column :events, :date_start
    remove_column :events, :date_end
    rename_column :events, :time_start, :start_time
    rename_column :events, :time_end, :end_time
  end
end
