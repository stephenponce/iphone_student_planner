class TasksController < ApplicationController
  
  layout 'tasks'

   def index
    @date_index = Date.new(y=1,m=1,d=1)
    @tasks = Task.find(:all, :order => "date ASC")
  end
   
  def new
    @task = Task.new    
    @event_list=  Event.find(:all, :order=>'title ASC')
    
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
