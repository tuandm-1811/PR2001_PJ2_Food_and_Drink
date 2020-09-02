Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do 
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    get "signup" => "devise/registrations#new"
    post "signup" => "devise/registrations#create"
  end
  root 'homepages#home'
  get 'home', to: 'homepages#home'
  resources :users, only: :show
  resources :password_resets, only: [:new, :create, :edit,:update]
end 
