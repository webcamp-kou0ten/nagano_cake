Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  namespace :public do
    resource :customers, only:[:show, :edit, :update]
    patch 'customers' => 'customers#exit'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :addresses, only:[:create, :index, :edit, :update, :destroy]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:update, :index, :destroy, :create]
    delete 'cart_items/:id' => 'cart_items#all_destroy'
    resources :orders, only:[:new, :create, :show, :index]
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/confirm' => 'orders#confirm'
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only:[:new, :create, :edit, :update, :index, :show]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :orders, only:[:show, :index]
    patch 'admin/orders/:id/production_status' => 'onders#production_status'
    get 'admin/orders/:id/order_status' => 'onders#order_status'
  end
end
