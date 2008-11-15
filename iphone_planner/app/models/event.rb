require 'vpim'
class Event < ActiveRecord::Base
  belongs_to :schedule
  has_many :tasks

  def occurs_on
    
    
  end
  
  def to_ics
    cal = Icalendar::Calendar.new
    loc_string = ""
    loc_string << self.location_name
    event = Icalendar::Event.new
    event.klass	"PUBLIC"
    event.dtstart DateTime.civil(
			self.date_start.strftime("%Y").to_i,
			self.date_start.strftime("%m").to_i,
			self.date_start.strftime("%d").to_i,
			self.time_start.strftime("%H").to_i,
			self.time_start.strftime("%M").to_i )	

    event.duration	self.duration
    event.summary	self.title
    event.description	self.description
    event.location	loc_string #self.location_name
    event.dtstamp	self.created_at.to_datetime
    event.uid		"event-#{self.id.to_s}"
    event.sequence	0
  end


end
