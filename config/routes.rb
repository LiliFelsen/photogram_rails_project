Rails.application.routes.draw do

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'sessions#new'

get '/signup', to: 'users#new', as: 'signup'
resources :users do
  member do
    get :following, :followers
  end
end

get '/login', to: 'sessions#new', as: 'login'
delete '/logout', to: 'sessions#destroy', as: 'logout'
resources :sessions

resources :pictures do
  member do
    get 'like'
  end
end

resources :tags
resources :comments

post 'users/:id/follow_user', to: 'relationships#follow_user', as: :follow_user
post 'users/:id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user


end
