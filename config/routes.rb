ActionController::Routing::Routes.draw do |map|
  map.resources :files

  map.resources :file_browsers

  map.resources :user_sessions
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.admin 'admin', :controller => 'admin/pages', :action => 'index'

  map.contact_us 'contact-us', :controller => 'contact', :action => "contact_us"
  map.connect 'our-realtors', :controller => 'realtors'

  map.resources :pages, :menu_items

  %w[show_form hide_form].each do |route|
      map.connect "admin/pages/#{route}", :controller => 'admin/pages', :action => "#{route}"
  end
  
  map.namespace :admin do |admin|
    admin.resources :pages, :member => {:show_form => :any,
                                        :hide_form => :any}
    admin.resources :menu_items, :member => {:sort =>:any}
    admin.resources :page_versions, :member => {:restore => :any}
    admin.resources :users
    admin.resources :realtors
  end


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => 'main', :action => 'content_page', :path => 'index'
  #Remap old routes
  map.connect "main.asp", :controller => 'main', :action => 'content_page', :path => 'index'
  map.connect "contact.asp", :controller => 'contact', :action => 'contact_us'

  #All content pages
  map.connect '*path', :controller => 'main', :action => 'content_page'
end
