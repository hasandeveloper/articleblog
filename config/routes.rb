Rails.application.routes.draw do
  devise_for :users
  resources :reviews


  root 'articles#index'
  resources :categories
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
