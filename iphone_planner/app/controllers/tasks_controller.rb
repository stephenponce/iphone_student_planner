class TasksController < ApplicationController
  
  layout 'tasks'

  def index
    @date_index = Date.new(y=1,m=1,d=1)
    @tasks = Task.find(:all, :order => "date ASC")
  end
   
  def by_task
    @tasks = Task.find(:all, :order => "title ASC")
    @tasks.sort! { |a,b| a.title.downcase <=> b.title.downcase}
  end

  def by_event
    @tasks = Task.find(:all, :order => "event_id ASC")
    @events = Array.new
    @tasks_no_event = Array.new
    index = 0
    @tasks.each do |t|
      if (t.event_id.nil?) 
         @tasks_no_event.push(t)
      elsif (t.event_id > index)
         @events.push(Event.find(t.event_id))
         index = t.event_id
      end
    end
  end

  def new
    @task = Task.new    
    #@event_list = Event.find(:all, :order=>'title ASC')
    #@event_list_sorted = @event_list.sort { |a,b| a.title.downcase <=> b.title.downcase}

  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
       redirect_to :action => 'index'
    else
       render :action => 'new'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
    #@event_list = Event.find(:all, :order=>'title ASC')
    #@event_list.sort! { |a,b| a.title.downcase <=> b.title.downcase}
  end
 
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end 
 end
 
  def delete
    Task.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

end
