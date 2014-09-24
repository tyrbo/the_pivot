Rails.application.routes.draw do
  root "welcome#index"

  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :orders, only: [:new, :create]
  resources :users, only: [:create, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit]
  resource  :verifications

  resources :suppliers, only: [:index, :new, :create, :show] do
    get      'pending_admin'    =>  'suppliers#add_pending_admin'
  end

  resource :cart, only: [:show, :update]
  resource :cart_item, only: [:update]

  namespace :dashboard do
    root to: 'dashboard#index'

    resources :orders

    resource :user, only: [:show, :edit, :update] do
      resources :addresses
    end

    resources :suppliers, only: [:index, :show, :edit, :update] do
      resources :items

      resources :users do
        get 'pending/confirm' => 'users#pending_remove', as: :remove_pending
        get 'pending/deny' => 'users#pending_add', as: :add_pending
      end

      resources :sub_orders do
        resources :order_items do
          get :increment, on: :member
          get :decrement, on: :member
        end
      end

      patch 'order/:id/cancel' => 'orders#cancel',   as: :cancel_order
      patch 'pay/:id/pay'      => 'orders#pay',      as: :pay_order
      patch 'pay/:id/complete' => 'orders#complete', as: :complete_order
      put 'retire/:id' => 'retire_item#update', as: :retire_item
    end
  end

  namespace :admin do
    root to: 'admin#index'

    resources :suppliers, only: [:index] do
      put 'toggle_enabled' => 'suppliers#toggle_enabled', as: :toggle_enabled
    end
  end

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  post     '/add_to_cart'      => 'carts#add_to_cart_view',  as: :add_to_cart
  get      '/about_us'         => 'about_us#index'
  get     '/search'           => 'items#search', as: :search_items
end
