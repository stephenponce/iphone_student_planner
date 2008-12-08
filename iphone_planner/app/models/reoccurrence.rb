class Reoccurrence < ActiveRecord::Base
  has_and_belongs_to_many :events

  validates_presence_of :title  

  
  def m
    return monday
  end
  def t
    return tuesday
  end
  def w
    return wednesday
  end
  def th
    return thursday
  end
  def f
    return friday
  end
  def s
    return saturday
  end
  def su
    return sunday
  end
  
  def day_list
    day_list = ''
    if m
      day_list += 'Monday'
    end
    if t
      day_list += 'Tuesday'
    end
    if w
      day_list+= 'Wednesday'
    end
    if th
      day_list+= 'Thursday'
    end
    if f
      day_list+= 'Friday'
    end
    if s
      day_list+= 'Saturday'
    end
    if su
      day_list+= 'Sunday'
    end

    return day_list
  end
  
  
  def occurs_on_this_day?(day)
    if (day.downcase == 'monday')
      return monday
    elsif (day.downcase == 'tuesday')
      return tuesday
    elsif (day.downcase == 'wednesday')
      return wednesday
    elsif (day.downcase == 'thursday')
      return thursday
    elsif (day.downcase == 'friday')
      return friday
    elsif (day.downcase == 'saturday')
      return saturday
    elsif (day.downcase == 'sunday')
      return sunday
    end
  end
end
