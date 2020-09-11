Rails.application.routes.draw do
  get 'rooms/show'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    get "signup" => "devise/registrations#new"
    post "signup" => "devise/registrations#create"
  end
  root 'homepages#home'
  mount ActionCable.server => '/cable'
  
  get 'home', to: 'homepages#home'
  resources :users, only: :show
  resources :password_resets, only: [:new, :create, :edit,:update]
end 
