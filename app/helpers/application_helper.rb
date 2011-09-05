# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper  

  def page_title
    @title || (@page.nil? ? controller.action_name.humanize.capitalize : @page.title)
  end

  def keywords
    @keywords || (@page.nil? ? '' : @page.keywords)
  end

  def description
    @description || (@page.nil? ? '' : @page.description)
  end

  def flash_message
   if flash[:note]
     klass = 'flash_note'
     flash_content = flash[:note]
   elsif flash[:notice]
     klass='flash_note'
     flash_content = flash[:notice]
   elsif flash[:error]
     klass = 'flash_error'
     flash_content = "<h1>Error!</h1>#{flash[:error]}</div>"
   end
   "<div class=#{klass}>#{flash_content}</div>"
  end

  def is_admin?
    if request.url.include?("/admin")
      true
    else
      false
    end
  end

  def draw_menu(m, options)
    id = options[:id] || m.downcase.gsub(' ', '-')
    direction = options[:direction]
    admin_only = options[:admin_only] || false
    if( admin_only and is_admin? ) or !admin_only
      # TODO add handling to partials for vertical and horizontal menus layouts
      menu = MenuItem.find_by_label(m)      
      if menu.nil?
        render :text => '' #:nothing => true
      end
      render :partial => "shared/menu_#{direction}", :locals => {:menu => menu, :id => id}
     end
  end

  def sort_link(title, field, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    direction = params[:direction] == 'ASC' ? 'DESC' : 'ASC'    
    link_to_unless condition, title, request.parameters.merge( {:field => field, :direction => direction} )
  end
end
