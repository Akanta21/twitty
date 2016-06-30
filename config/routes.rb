Rails.application.routes.draw do

  root 'home#public'

  get 'public', to:'posts#all', as:'home'

  # get '/', to:'home#public', as:'home'

  get 'sign_in', to: 'sessions#new'

  delete 'sign_out', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  resources :posts, only: [:all] do
    resources :comments
  end

  resources :users do
    resources :posts
  end
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
