Rails.application.routes.draw do
  get 'products/index'
  # devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'admin_auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :invoices, only:[:index, :show, :create, :destroy]
      resources :categories, only: [:index, :create, :destroy]
      resources :items, only:[:index, :create, :destroy, :update]
      resources :discounts, only:[:index]
      resources :vendors, only:[:index, :create, :update, :destroy]
      resources :customers, only:[:index, :create, :update, :destroy]
      resources :transactions, only:[:index, :create, :update, :destroy]
      resources :ledgers, only:[:index, :create, :update, :destroy]
      resources :products, only:[:index, :create, :update, :destroy]
      resources :sizes, only: [:index, :create]
    end
  end
  resources :companies
end
