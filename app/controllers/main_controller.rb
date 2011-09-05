class MainController < ApplicationController
  auto_complete_for :page, :title
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_page_title]
  # def index need not be defined because Rails will simply render the index.html.erb file in views/main

  def content_page
    
    @page = Page.find_by_url_tag(params[:path])
    
    unless @page.nil?
      
      @title = @page.html_title
      @h1 = @page.title

      respond_to do |format|
        format.html
        format.xml  { render :xml => @page }
      end
    else
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404.html", :status => "404 Not Found" }
        format.all { render :nothing => true, :status => "404 Not Found" }
      end
    end
  end

  def site_search
    @pages = Page.search(params[:search][:search_term])
  end

  def determine_layout
    if request[:action] != 'index' then 'application' else 'homepage' end
  end
end
