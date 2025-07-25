Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, except: :index

  namespace :admin do
    root to: "dashboard#index", as: :dashboard
    resources :adoptions
    resources :users, only: %i(index show) do
      member do
        patch :block
        patch :unblock
        put :update_role
      end
    end
  end
end
