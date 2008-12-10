class EventsController < ApplicationController
  layout 'schedules'
 
#implements the active scaffolding plugin for the events model
#  active_scaffold :event do |config|
#    config.columns = [ :location_name, :title, :location_name, :time_start, :duration, :description, :reoccuring_event]
#    list.columns.exclude [:time_end, :category]
#  end
#end
  def freq_options
  end

  def change_view 
    @year = params[:year]
    @month= params[:month]
    @day= params[:day]
  end


  # GET /events
  # GET /events.xml
  def index
    @events = Event.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @day = Time.now.day
    @month = Time.now.month
    @year = Time.now.year    
    
    @view = 'new'  
    #gets the first reoccurrence
    @once_reocc=Reoccurrence.find(:first, :conditions=> ['frequency=?', "Once" ])
    @monthly_reocc=Reoccurrence.find(:first, :conditions=> ['frequency=?', "Monthly" ])
    @su_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Sunday" ])
    @m_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Monday" ])
    @t_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Tuesday" ])
    @w_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Wednesday" ])
    @th_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Thursday" ])
    @f_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Friday" ])
    @sa_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Saturday" ])

    #create list and push Once onto the top
    @reoccurrence_list = Array.new
    @reoccurrence_list.push(@once_reocc)
    @reoccurrence_list.push(@su_reocc)
    @reoccurrence_list.push(@m_reocc)
    @reoccurrence_list.push(@t_reocc)
    @reoccurrence_list.push(@w_reocc)
    @reoccurrence_list.push(@th_reocc)
    @reoccurrence_list.push(@f_reocc)
    @reoccurrence_list.push(@sa_reocc)

    #gets other reoccurrences
    @other_reocc= Reoccurrence.find(:all, :order=> "frequency, title", :conditions=>['frequency!=? AND frequency!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=?', "Once","Monthly","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"] )

    @other_reocc.each do |r|
      @reoccurrence_list.push(r)
    end
    @reoccurrence_list.push(@monthly_reocc)
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @day = Time.now.day
    @month = Time.now.month
    @year = Time.now.year

    @view = 'edit'
    #gets the first reoccurrence
    @once_reocc=Reoccurrence.find(:first, :conditions=> ['frequency=?', "Once" ])
    @monthly_reocc=Reoccurrence.find(:first, :conditions=> ['frequency=?', "Monthly" ])
    @su_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Sunday" ])
    @m_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Monday" ])
    @t_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Tuesday" ])
    @w_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Wednesday" ])
    @th_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Thursday" ])
    @f_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Friday" ])
    @sa_reocc=Reoccurrence.find(:first, :conditions=> ['title=?', "Saturday" ])

    #create list and push Once onto the top
    @reoccurrence_list = Array.new
    @reoccurrence_list.push(@once_reocc)
    @reoccurrence_list.push(@su_reocc)
    @reoccurrence_list.push(@m_reocc)
    @reoccurrence_list.push(@t_reocc)
    @reoccurrence_list.push(@w_reocc)
    @reoccurrence_list.push(@th_reocc)
    @reoccurrence_list.push(@f_reocc)
    @reoccurrence_list.push(@sa_reocc)

    #gets other reoccurrences
    @other_reocc= Reoccurrence.find(:all, :order=> "frequency, title", :conditions=>['frequency!=? AND frequency!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=? AND title!=?', "Once","Monthly","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"] )

    @other_reocc.each do |r|
      @reoccurrence_list.push(r)
    end
    @reoccurrence_list.push(@monthly_reocc)


    all_tasks = Task.find(:all)
    @tasks = Array.new
    all_tasks.each do |t|
        if (t.event_id.to_i == params[:id].to_i)
            @tasks.push(t)
        end
    end

    #@reoccurrence_list = @event.reoccurrences
   
    logger.info  @reoccurrences
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to :controller=>'schedules', :action => 'show_day', :year=>@event.time_start.year, :month=>@event.time_start.month, :day=>@event.time_start.day }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to :controller=>'date', :year=>@event.time_start.year, :month=>@event.time_start.month, :day=>@event.time_start.day }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def delete
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :controller=>'date', :year=>Time.now.year, :month=>Time.now.month, :day=>Time.now.day 

  end


end
