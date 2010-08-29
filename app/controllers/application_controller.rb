# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

#  before_filter do |r|
#    r.send(:check_authentication) if r.params[:controller] =~ /^admin/
#  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #We define these here so that we can access them in both controllers and views.
  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def check_authentication
    unless current_user
      #save intended controller in parms
      session[:intended_controller] = controller_name
      session[:intended_action] = action_name      
      flash[:notice] = "You must login to see the page you requested."
      redirect_to login_url
      return false
    end
    #check_authorization
  end

  def check_authorization
    unless current_user.roles.detect{ |role|
      role.rights.detect{ |right|
        right.action == action_name && right.controller == self.class.controller_path}
    } 
      flash[:notice] = "You are not authorized to view the page you requested"
      request.env["HTTP_REFERER"] ? (redirect_to :back) : (redirect_to root_url)
      return false
    end
  end
end
