class AddEventColumns < ActiveRecord::Migration
  def self.up
    add_column :events, :location_name, :string
    add_column :events, :description, 	:string
    add_column :events, :start_time, 	:datetime
    add_column :events, :end_time, 	:datetime
    add_column :events, :duration, 	:datetime
    add_column :events, :category, 	:string
  end

  def self.down
    remove_column :events, :location_name
    remove_column :events, :description
    remove_column :events, :start_time
    remove_column :events, :end_time
    remove_column :events, :category
    remove_column :events, :duration


  end
end
