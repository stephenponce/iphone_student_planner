require 'vpim'
class Event < ActiveRecord::Base
  belongs_to :schedule
  has_many :tasks
  has_and_belongs_to_many :reoccurrences

  validates_presence_of :title, :time_start, :time_end, :message => "missing required field"

  
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
  
  #calculates the week of the month from time_start
  def week_of_month
    # week will be 1 or 2
    if(self.time_start.day < 8)
      beg_of_week = self.time_start.beginning_of_week
      #this means that the time_start occurs on the first week in the month
      if beg_of_week.day !=1 
        return 2
      else
        return 1
      end
    #week will be 2 or 3
    elsif(self.time_start.day < 16)
      beg_of_week = self.time_start.beginning_of_week
    end
      
    
  end
  
  def occurs_today?(year, month, day)
    
    if self.time_end.nil?
      self.time_end = self.time_start
    end
    if self.time_start.nil?
      return false
    end
    

    # Encapsulates the entire day from midnight to 1159 pm
    curr_date_start = Time.gm(year, month, day, 0, 0, 0, 0)
    curr_date_end   = Time.gm(year, month, day, 23, 59, 59, 0)
    
    if (self.reoccurrences.empty?)
     #REturns true if the event occurs between 12am and 1159pm on the current date
      return ((self.time_start >= curr_date_start) && ( curr_date_end >= self.time_start))

    #if the current date is before the reoccurs until date continue with the cases
    elsif (self.reoccurs_until.nil? || self.reoccurs_until > curr_date_end.to_date)
      
        #base case
        if ((self.time_start >= curr_date_start) && ( curr_date_end >= self.time_start))
          return true

        #daily case:
        #   =>  this assumes daily means every day of the week without exceptions
        elsif (self.reoccurrences[0].frequency.downcase == 'daily')
          return true

        #weekly case:
        #   => check what the day is and see if the reoccurrences occurs onthat day          
        elsif (self.reoccurrences[0].frequency.downcase == 'weekly')
            curr_day = curr_date_start.strftime("%A")
          return  self.reoccurrences[0].occurs_on_this_day?(curr_day)

	#monthly case:    
	#   => check what the day is from the original event occurred on
	#   => check what the day of the curr_date is
	elsif (self.reoccurrences[0].frequency.downcase == 'monthly')
	  original_day = self.time_start.strftime("%d")
	  curr_day = curr_date_start.strftime("%d")

	  if (original_day == curr_day)
	    return true   
	  else
	    return false
	  end

        end

                     
    end

  end


end
    #EXTRA CODE THAT GOES IN THE MONTHLY CASE OF OCCURS_TODAY
                #check reoccurrence week with event week of month
    #            if(self.reoccurrences[0].week_of_month = self.week_of_month)
    #              return true
    #            else
    #              return false
    #            end

#  else #otherwise we instantly return false
#    return false
#  end
