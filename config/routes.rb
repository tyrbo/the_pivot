Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders
<<<<<<< HEAD
  resources :users
=======
>>>>>>> order-dashboard

  namespace :admin do
    resources :items
    resources :categories
  end

<<<<<<< HEAD
=======
  
>>>>>>> order-dashboard
  get   '/cart'       => 'carts#show',        as: :cart
  get   '/cart/edit'  => 'carts#edit',        as: :edit_cart
  patch '/cart'       => 'carts#update'
  put   '/cart'       => 'carts#update'
  post  '/cart/items' => 'cart_items#create', as: :cart_items
  delete '/cart/items' => 'cart_items#destroy', as: :cart_items_destroy

  get  '/order_items/new' => 'order_items#new', as: :new_order_item
  post  '/order_items'    => 'order_items#create', as: :order_items
end
