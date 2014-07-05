Rails.application.routes.draw do

  # ------------------------------------------ Public

  resources :accounts, :except => [:show] do
    resources :servers, :only => [:index,:create]
  end
  post 'config/update' => 'config#update', :as => :update_config
  get 'config' => 'config#show', :as => :config

  # ------------------------------------------ Root

  root :to => 'accounts#index'

end
