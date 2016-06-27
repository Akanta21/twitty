Rails.application.routes.draw do
  root 'page_control#public'

  get '/', to:'page_control#public', as: 'home'

  get 'sessions/new'

  get 'login', to:'sessions#new'

  delete 'logout', to: 'sessions#destroy'

  resources :posts
  resources :users

  # resources :users do
  #   resources :posts
  # end
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
