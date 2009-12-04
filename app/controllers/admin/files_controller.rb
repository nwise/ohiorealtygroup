class Admin::FilesController < ApplicationController
  # GET /admin/files
  # GET /admin/files.xml
  def index

    #show full editable file-tree with current level expanded

    #strip out ../ from params
    path = RAILS_ROOT + "/public" + USERFILES
    list = Dir.entries(path)
    @files = File.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @files }
    end
  end

  # GET /admin/files/1
  # GET /admin/files/1.xml
  def show
    #display in browser or send
    @file = File.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @file }
    end
  end

  # GET /admin/files/new
  # GET /admin/files/new.xml
  def new
    #upload a new file
    @file = File.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @file }
    end
  end

  # GET /admin/files/1/edit
  def edit
    #change filename or resize with jCrop
    @file = File.find(params[:id])
  end

  # POST /admin/files
  # POST /admin/files.xml
  def create
    #upload new file
    @file = File.new(params[:file])

    respond_to do |format|
      if @file.save
        flash[:notice] = 'File was successfully created.'
        format.html { redirect_to(@file) }
        format.xml  { render :xml => @file, :status => :created, :location => @file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/files/1
  # PUT /admin/files/1.xml
  def update
    #change filename or resize with jCrop
    @file = File.find(params[:id])

    respond_to do |format|
      if @file.update_attributes(params[:file])
        flash[:notice] = 'File was successfully updated.'
        format.html { redirect_to(@file) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/files/1
  # DELETE /admin/files/1.xml
  def destroy
    #delete file from filesystem
    @file = File.find(params[:id])
    @file.destroy

    respond_to do |format|
      format.html { redirect_to(admin_files_url) }
      format.xml  { head :ok }
    end
  end
end
