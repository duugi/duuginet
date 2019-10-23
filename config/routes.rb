

Rails.application.routes.draw do
  resources :libraries
  resources :categories
  resources :permissions
  resources :post_comments
  resources :roles
  resources :posts

  #Devise Users
  devise_for :admins
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  draw :backend
  draw :hrms

  draw :dashboard
  draw :profile

  draw :api_v1

  scope "(:locale)", :locale => /en|mn/ do
    root to: "pages#index"
    get "page/index"
  end

  root to: "pages#index"

  #404
#  get '*unmatched_route', to: 'pages#route_not_found'
  #, only: [:show, :edit, :update, :preferences]
end
