Ohiorealtygroup::Application::routes.draw do

  root to: 'main#content_page'

  resources :files
  resources :file_browsers
  resources :user_sessions

  get "login", to: 'user_sessions#new'
  get "logout", to: 'user_sessions#destroy'
  get "admin", to: "admin/pages#index"
  get "our-realtors", to: "realtors#index"
  get "contact-us", to: "contact#contact_us"
  post "contact-us", to: "contact#contact_us"

  resources :pages
  resources :menu_items

  namespace :admin do |admin|
    resources :pages
    resources :menu_items, :member => {:sort =>:any}
    resources :page_versions, :member => {:restore => :any}
    resources :users
    resources :realtors
  end

  get '*path', to: 'main#content_page'
end
