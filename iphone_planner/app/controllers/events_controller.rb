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
    
    @reoccurrences = Reoccurrence.find(:all)
   
    
    
    @frequency_list=['once', 'daily','weekly','monthly']

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

    all_tasks = Task.find(:all)
    @tasks = Array.new
    all_tasks.each do |t|
        if (t.event_id.to_i == params[:id].to_i)
            @tasks.push(t)
        end
    end

    @reoccurrences = @event.reoccurrences
   
    logger.info  @reoccurrences
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to :controller=>'schedules', :action => 'show_day', :year=>Time.now.year, :month=>Time.now.month, :day=>Time.now.day}
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
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to :controller=>'date', :year=>Time.now.year, :month=>Time.now.month, :day=>Time.now.day }
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
