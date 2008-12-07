class Task < ActiveRecord::Base

  belongs_to :event
  
  validates_presence_of :title, :date, :message => "missing required field"
  
  def self.find_by_event_id(event_id)
   if event_id != nil
     Task.find(:first, :conditions=>{:event_id => event_id.to_i})
    else
      nil
    end
    
  end



end
