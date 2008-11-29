class AddMonthlyColsToReoccurrences < ActiveRecord::Migration
  def self.up
    add_column :reoccurrences, :week_of_month, :string

  end

  def self.down
    remove_column :reoccurrences, :week_of_month
  end
end
