class ReoccurrencesController < ApplicationController
  layout 'reoccurrences'
  
  # GET /reoccurrences
  # GET /reoccurrences.xml
  def index
    @reoccurrences = Reoccurrence.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reoccurrences }
    end
  end

  # GET /reoccurrences/1
  # GET /reoccurrences/1.xml
  def show
    @reoccurrence = Reoccurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reoccurrence }
    end
  end

  # GET /reoccurrences/new
  # GET /reoccurrences/new.xml
  def new
    @reoccurrence = Reoccurrence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reoccurrence }
    end
  end

  # GET /reoccurrences/1/edit
  def edit
    @reoccurrence = Reoccurrence.find(params[:id])
  end

  # POST /reoccurrences
  # POST /reoccurrences.xml
  def create
    @reoccurrence = Reoccurrence.new(params[:reoccurrence])

    respond_to do |format|
      if @reoccurrence.save
        flash[:notice] = 'Reoccurrence was successfully created.'
        format.html { redirect_to(@reoccurrence) }
        format.xml  { render :xml => @reoccurrence, :status => :created, :location => @reoccurrence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reoccurrence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reoccurrences/1
  # PUT /reoccurrences/1.xml
  def update
    @reoccurrence = Reoccurrence.find(params[:id])

    respond_to do |format|
      if @reoccurrence.update_attributes(params[:reoccurrence])
        flash[:notice] = 'Reoccurrence was successfully updated.'
        format.html { redirect_to(@reoccurrence) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reoccurrence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reoccurrences/1
  # DELETE /reoccurrences/1.xml
  def destroy
    @reoccurrence = Reoccurrence.find(params[:id])
    @reoccurrence.destroy

    respond_to do |format|
      format.html { redirect_to(reoccurrences_url) }
      format.xml  { head :ok }
    end
  end
end
