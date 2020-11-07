Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  resource :two_factor_auth, only: [:new, :create, :destroy]

  namespace :users do
    resources :main_registrations do
      get :profile_image, on: :collection
      patch :upload_profile_image
      get :department_search, on: :collection
      get :faculty_search, on: :collection
      get :university_edit, on: :collection
      get :profile_image_edit, on: :collection
    end
  end

  namespace :viewer do
    resources :items
  end

  root to: 'viewer/items#index'
end
