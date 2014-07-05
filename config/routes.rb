Rails.application.routes.draw do

  # ------------------------------------------ Public

  resources :accounts, :except => [:new]
  resources :servers, :except => [:show, :new]
  post 'config/update' => 'config#update', :as => :update_config
  get 'config' => 'config#show', :as => :config

  # ------------------------------------------ Root

  root :to => 'accounts#index'

end
