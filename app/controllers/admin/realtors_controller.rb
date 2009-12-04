class Admin::RealtorsController < ApplicationController
  # GET /admin_realtors
  # GET /admin_realtors.xml
  def index
    @admin_realtors = Admin::Realtor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_realtors }
    end
  end

  # GET /admin_realtors/1
  # GET /admin_realtors/1.xml
  def show
    @realtor = Admin::Realtor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @realtor }
    end
  end

  # GET /admin_realtors/new
  # GET /admin_realtors/new.xml
  def new
    @realtor = Admin::Realtor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @realtor }
    end
  end

  # GET /admin_realtors/1/edit
  def edit
    @realtor = Admin::Realtor.find(params[:id])
  end

  # POST /admin_realtors
  # POST /admin_realtors.xml
  def create
    @realtor = Admin::Realtor.new(params[:realtor])

    respond_to do |format|
      if @realtor.save
        flash[:notice] = 'Admin::Realtor was successfully created.'
        format.html { redirect_to(@realtor) }
        format.xml  { render :xml => @realtor, :status => :created, :location => @realtor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @realtor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_realtors/1
  # PUT /admin_realtors/1.xml
  def update
    @realtor = Admin::Realtor.find(params[:id])

    respond_to do |format|
      if @realtor.update_attributes(params[:realtor])
        flash[:notice] = 'Admin::Realtor was successfully updated.'
        format.html { redirect_to(@realtor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @realtor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_realtors/1
  # DELETE /admin_realtors/1.xml
  def destroy
    @realtor = Admin::Realtor.find(params[:id])
    @realtor.destroy

    respond_to do |format|
      format.html { redirect_to(admin_realtors_url) }
      format.xml  { head :ok }
    end
  end
end
