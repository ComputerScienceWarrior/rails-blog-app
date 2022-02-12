Rails.application.routes.draw do
  resources :user do
    resources :blog
  end
  get '/login', to: 'sessions#login'
  root 'static#home'
end
