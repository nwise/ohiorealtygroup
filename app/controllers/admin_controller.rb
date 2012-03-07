class AdminController < ApplicationController
   before_filter :check_authentication
   layout "admin"
  def index
    
  end
end
