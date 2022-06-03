Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'worries#index'

  # root to: 'top#index'
  
  resources :worries do

    member do
      get 'indexmain'
      end

  end
end
