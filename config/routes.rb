Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :study_years
    resources :departments
    resources :memberships
    root to: 'users#index'
  end

  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :members do
    resources :subscriptions, except: [:index, :show]
  end
end
