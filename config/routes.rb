Rails.application.routes.draw do
  resources :user do
    resources :blog
  end
  root 'static#home'
end
