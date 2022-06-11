Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'worries#index'

  # root to: 'top#index'

  post  'love/:id' => 'loves#create', as: 'create_love'
  delete 'love/:id' => 'loves#destroy', as: 'destroy_love'

  resources :worries do

    resources :comments, only: :create

    # resource :loves, only: [:create, :destroy]

    member do
      get 'indexmain'
      end

  end
end
