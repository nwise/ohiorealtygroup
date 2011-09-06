class Admin::RealtorsController < ApplicationController
  before_filter :check_authentication
  # GET /realtors
  # GET /realtors.xml
  def index
    @realtors = Realtor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @realtors }
    end
  end

  # GET /realtors/1
  # GET /realtors/1.xml
  def show
    @realtor = Realtor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @realtor }
    end
  end

  # GET /realtors/new
  # GET /realtors/new.xml
  def new
    @realtor = Realtor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @realtor }
    end
  end

  # GET /realtors/1/edit
  def edit
    @realtor = Realtor.find(params[:id])
  end

  # POST /realtors
  # POST /realtors.xml
  def create
    @realtor = Realtor.new(params[:realtor])

    respond_to do |format|
      if @realtor.save
        flash[:notice] = 'Realtor was successfully created.'
        format.html { redirect_to(admin_realtors_url) }
        format.xml  { render :xml => @realtor, :status => :created, :location => @realtor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @realtor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /realtors/1
  # PUT /realtors/1.xml
  def update
    @realtor = Realtor.find(params[:id])

    respond_to do |format|
      if @realtor.update_attributes(params[:realtor])
        flash[:notice] = 'Realtor was successfully updated.'
        format.html { redirect_to(admin_realtors_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @realtor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /realtors/1
  # DELETE /realtors/1.xml
  def destroy
    @realtor = Realtor.find(params[:id])
    
    if @realtor.destroy
      flash[:notice] = 'Realtor was successfully deleted.'
      respond_to do |format|        
        format.html { redirect_to(admin_realtors_url) }
        format.xml  { head :ok }
      end
    end
  end
end
