class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string     :title, :limit => 64, :null => false
      t.text       :description
      t.date       :date
      t.integer    :event_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
