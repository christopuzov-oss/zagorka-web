Rails.application.routes.draw do
  get  %q(admin-login),  to: %q(admin_sessions#new),     as: :admin_login
  post %q(admin-login),  to: %q(admin_sessions#create)
  get  %q(admin-logout), to: %q(admin_sessions#destroy), as: :admin_logout
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/site_admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get  'age-gate', to: 'home#age_gate' 
  
  get '/pivovarna/pivovarniyat-protses', to: 'static_pages#brewing_process'
  resources :contacts 
  resources :products
  resources :articles
  resources :irregularities 

  get 'kompaniyata/leaders', to: 'leaders#index' 
  get 'kompaniyata/leaders/:name_url', to: 'leaders#show' 

  get '/karieri/otvoreni-pozitsii', to: 'job_offers#index'
  get '/karieri/forma-za-kandidatstvane', to: 'job_offers#show'
  post '/karieri/apply', to: 'job_offers#apply'
  
  get ':category/:slug', to: 'static_pages#show' 
  get 'search', to: 'search#index'
  get 'signals', to: 'irregularities#index'


end
