Rails.application.routes.draw do
  root "welcome#index"

  resources :items, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :orders, only: [:create, :show]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resource :cart, only: [:show, :edit, :update]

  namespace :supplier do
    resources :supplier
    resources :items
    resources :categories
    resources :orders do
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

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/supplier_dashboard',  to: 'supplier/supplier#show',  via: 'get'

  get     '/add_to_cart'      => 'carts#add_to_cart_view',  as: :add_to_cart
  get     '/about_us'          => 'about_us#index' 

  post    '/cart/items'       => 'cart_items#create',       as: :cart_items
  delete  '/cart/items'       => 'cart_items#destroy',      as: :cart_items_destroy
end
