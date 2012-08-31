Communal2::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "auth"}
  devise_scope :user do
    get '/users/auth/:provider' => 'auth#passthru'
  end
  resources :users, :only => [:index, :edit, :update]

  root :to => 'users#index'

  end
