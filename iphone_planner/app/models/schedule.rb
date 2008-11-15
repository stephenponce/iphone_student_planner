class Schedule < ActiveRecord::Base
  has_many :events

  def current_year
    @year=Time.now.strftime("%Y")
  end
  
  def current_month
    @month=Time.now.strftime('%m')
  end
  
  def current_day
    @day=Time.now.strftime('%d')
  end
  

end
