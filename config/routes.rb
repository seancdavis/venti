Rails.application.routes.draw do

  # ------------------------------------------ Public

  resources :accounts, :only => [:index,:create] do
    resources :servers, :only => [:index,:create]
  end
  post 'config/update' => 'config#update', :as => :update_config

  # ------------------------------------------ Root

  root :to => 'accounts#index'

end
