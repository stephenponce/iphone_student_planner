class EventsReoccurrences < ActiveRecord::Migration
  def self.up
    
    create_table :events_reoccurrences, :id=> false do |t|
      t.column :event_id, :integer
      t.column :reoccurrence_id, :integer
    end
    
    add_index :events_reoccurrences, [:event_id]
    add_index :events_reoccurrences, [:reoccurrence_id]
  end

  def self.down
    drop_table :events_reoccurrences
  end
end
