class SchedulesController < ApplicationController
include CalendarHelper

  layout 'schedules'
  
  Day_List = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday' ]

  #Month_List[0]=>'January'; Month_List[11]=>'December'
  Month_List = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  listOfSpecialDays = ['1','4']

  def month_view_list
    render :text=>'Invalid Month'
  end

  #used for individual days  
  def show_day

    @year = params[:year]
    @month= params[:month]
    @day=   params[:day]

    current_time=Time.new

    t=Time.new
    #construct the date you want to look     
    Time.gm(2000,"jan",1,20,15,1)   #=> Sat Jan 01 20:15:01 UTC 2000
    
    @current_date= Time.gm(@year, @month, @day, t.hour, t.min, t.sec, t.usec)
    @current_date_start = Time.gm(@year, @month, @day, 0, 0, 0, 0)
    @current_date_end = Time.gm(@year, @month, @day, 23, 59, 59, 0)
    
   @events = Event.find :all, :order => 'time_start ASC',
        :conditions => ['time_start >= ? AND time_start <= ?', @current_date_start, @current_date_end] 

    #subtract 1 to correctly index the text arrays
    @day_text = Day_List[@month.to_i-1]
    @month_text = Month_List[@month.to_i-1]

   
  end

  #used for viewing an entire month
  def show_month
    @year = params[:year]
    @month= params[:month]
    
  end


  # GET /schedules
  # GET /schedules.xml
  def index
    @schedules = Schedule.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.xml
  #def show
  #  @schedule = Schedule.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @schedule }
  #  end
  #end

  # GET /schedules/new
  # GET /schedules/new.xml
  def new
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.xml
  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        flash[:notice] = 'Schedule was successfully created.'
        format.html { redirect_to(@schedule) }
        format.xml  { render :xml => @schedule, :status => :created, :location => @schedule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.xml
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        flash[:notice] = 'Schedule was successfully updated.'
        format.html { redirect_to(@schedule) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.xml
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to(schedules_url) }
      format.xml  { head :ok }
    end
  end
end
