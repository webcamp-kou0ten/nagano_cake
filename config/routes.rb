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
  
  get '/search' => 'searches#search'

  namespace :public do
    resource :customers, only:[:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/unsubscribe' => 'customers#exit'
    resources :addresses, only:[:create, :index, :edit, :update, :destroy]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:update, :index, :destroy, :create] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
    
    resources :orders, only:[:new, :create, :show, :index]
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/confirm' => 'orders#confirm'
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only:[:new, :create, :edit, :update, :index, :show]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :orders, only:[:show, :index]
    patch 'admin/orders/:id/production_status' => 'orders#production_status'
    get 'admin/orders/:id/order_status' => 'orders#order_status'
  end
  
end
