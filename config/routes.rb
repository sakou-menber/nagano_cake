Rails.application.routes.draw do

scope module: :public do
  # 顧客用
  root 'homes#top'
  get 'about' => 'homes#about'
  # get '/items' => 'items#index'
  # get '/items/:id' => 'items#show', as: :item
  get '/customers/mypage' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  get '/customers/check' => 'customers#check'
  #get '/cart_items' => 'cart_items#index'
  get '/orders/new' => 'orders#new'
  get '/orders' => 'orders#index'
  get '/orders/:id' => 'orders#show', as: :order
  
  post '/orders/confirm' => 'orders#confirm'
  post '/orders' => 'orders#create'

  patch '/customers/information' => 'customers#update'

  patch  '/customers/withdraw' => 'customers#withdraw'
  resources :items, only: [:index, :show]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy,:create]
end
  #resources :customers, only: [:show, :edit, :check]

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


namespace :admin do
  # 管理者用
  get '/' => 'homes#top'
  #get '/items' => 'admin/items#index'
  #post '/admin/items' => 'admin/items#create'
  # get 'admin/items/new' => 'admin/items#new'
  # get 'admin/items/:id' => 'admin/items#show'
  # get '/admin/items/:id/edit' => 'admin/items#edit'
  # get 'admin/customers' => 'admin/customers#index'
  # get '/admin/customers/:id' => 'admin/customers#show'
  # get '/admin/customers/:id/edit' => 'admin/customers#edit'
  get 'admin/orders/:id' => 'admin/orders#show'

  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]


end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

