Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :study_years
    resources :departments
    root to: 'users#index'
  end

  root to: 'visitors#index'
  devise_for :users
end
