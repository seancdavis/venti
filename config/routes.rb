Rails.application.routes.draw do

  # ------------------------------------------ Public

  resources :accounts, :only => [:index,:create] do
    resources :servers, :only => [:index,:create]
  end

  # ------------------------------------------ Root

  root :to => 'accounts#index'

end
