namespace :dashboard do
  resources :hrms
end

get 'dashboard', to: 'dashboard#index'
