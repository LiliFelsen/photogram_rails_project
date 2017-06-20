Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'

get '/signup', to: 'users#new', as: 'signup'
resources 'users'

get '/login', to: 'sessions#new', as: 'login'
delete '/logout', to: 'sessions#destroy', as: 'logout'
resources 'sessions'

resources 'pictures'

end
