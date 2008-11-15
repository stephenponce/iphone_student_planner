class AddScheduleColumns < ActiveRecord::Migration
  def self.up
    add_column :schedules, :title, :string
    add_column :schedules, :userName, :string
    add_column :schedules, :userId, :integer
  end

  def self.down
    remove_column :schedules, :title
    remove_column :schedules, :userName
    remove_column :schedules, :userId
  end
end
