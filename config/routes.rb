Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
      post "users/create", to: "api/v1/users#create"

      post "education/create" , to: "api/v1/education#create"
      

      resources :users
      # post 'import_users', to: 'users#import_users', as: 'import_users'

      resources :education
    # devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
    # # ActiveAdmin.routes(self)

    # devise_for :users
    # resources :users

  end 
    