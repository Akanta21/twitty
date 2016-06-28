Rails.application.routes.draw do

  get '/', to:'posts#index', as:'home'

  # get '/', to:'home#public', as:'home'

  get 'sign_in', to: 'sessions#new'

  delete 'sign_out', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :users, only: [:create, :delete, :show] do
    resources :posts
  end
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
