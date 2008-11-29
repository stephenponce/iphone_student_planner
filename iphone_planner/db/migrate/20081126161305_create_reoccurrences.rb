class CreateReoccurrences < ActiveRecord::Migration
  def self.up
    create_table :reoccurrences do |t|

      t.timestamps
      t.column :title, :string 
      t.column :frequency, :string, :default => 'once' #once, daily, weekly, monthly
      # boolean values for each day
      t.column :sunday, :boolean, :default =>false
      t.column :monday, :boolean, :default =>false
      t.column :tuesday, :boolean, :default => false
      t.column :wednesday, :boolean, :default => false
      t.column :thursday, :boolean, :default => false
      t.column :friday, :boolean, :default => false
      t.column :saturday, :boolean, :default => false
      t.column :sunday, :boolean, :default => false

    end
  end

  def self.down
    drop_table :reoccurrences
  end
end
