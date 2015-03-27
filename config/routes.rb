Ohiorealtygroup::Application::routes.draw do

  root to: 'main#content_page' #, path: 'index'

  resources :files
  resources :file_browsers
  resources :user_sessions

  get "login", to: 'user_sessions#new'
  get "logout", to: 'user_sessions#destroy'
  get "admin", to: "admin/pages#index"
  # map.login 'login', :controller => 'user_sessions', :action => 'new'
  # map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  # map.admin 'admin', :controller => 'admin/pages', :action => 'index'

  # map.contact_us 'contact-us', :controller => 'contact', :action => "contact_us"
  # map.connect 'our-realtors', :controller => 'realtors'

  resources :pages
  resources :menu_items
  
  # namespace :admin do |admin|
  #   admin.resources :pages
  #   admin.resources :menu_items, :member => {:sort =>:any}
  #   admin.resources :page_versions, :member => {:restore => :any}
  #   admin.resources :users
  #   admin.resources :realtors
  # end


  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'


  # map.root :controller => 'main', :action => 'content_page', :path => 'index'
  
  # #Remap old routes
  # map.connect "main.asp", :controller => 'main', :action => 'content_page', :path => 'index'
  # map.connect "contact.asp", :controller => 'contact', :action => 'contact_us'

  # #All content pages
  # map.connect '*path', :controller => 'main', :action => 'content_page'
  get '*all', to: 'main#content_page'
end
