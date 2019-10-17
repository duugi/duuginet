put 'users/save', :to => 'users#save'

post 'users/:id/save', to: 'users#save'
get 'users/:id/tab/:subtab', to: 'users#show'

get 'backend/profile', to: 'backend/profile#index', as: "backend_profile"
get 'backend/profile/edit_general', to: 'backend/profile#edit_general', as: "backend_profile_general"
post 'backend/profile/post_general', to: 'backend/profile#post_general'

get 'backend/profile/upload_avatar', to: 'backend/profile#upload_avatar', as: "backend_profile_avatar"
post 'backend/profile/post_update_avatar', to: 'backend/profile#post_update_avatar', as: "backend_post_update_avatar"

get 'backend/profile/security', to: 'backend/profile#security', as: "backend_profile_security"
get 'backend/profile/preferences', to: 'backend/profile#preferences', as: "backend_profile_preferences"

get 'users/:id/edit_extra', to: 'users#edit_extra', as: 'user_edit_extra'
post 'users/post_extra', to: 'users#post_extra'

get 'backend/user_profile/security', to: 'backend/user_profile#security'

#get 'current', to: 'pages#current'
#get 'current', to: 'pages#current'

post 'roles/:id/post_permission/:format', to: 'roles#post_permission'
