Rails.application.routes.draw do
  devise_for :admins
  resources :post_comments
  resources :roles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
  resources :posts
  resources :users

  put 'users/save', :to => 'users#save'

  post 'users/:id/save', to: 'users#save'
  get 'users/:id/tab/:subtab', to: 'users#show'


  #, only: [:show, :edit, :update, :preferences]
end
