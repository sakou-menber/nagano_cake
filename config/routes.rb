Rails.application.routes.draw do

scope module: :public do
  # 顧客用
  root 'homes#top'
  get 'about' => 'homes#about'
  get '/customers/mypage' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  get '/customers/check' => 'customers#check'
  get '/orders/confirm' => 'orders#confirm'
  get '/orders/new' => 'orders#new'
  get '/orders' => 'orders#index'
  get '/orders/complete' =>'orders#complete'
  get '/orders/:id' => 'orders#show', as: :order


  post '/orders/confirm' => 'orders#confirm'
  post '/orders' => 'orders#create'

  patch '/customers/information' => 'customers#update'

  patch  '/customers/withdraw' => 'customers#withdraw'
  resources :items, only: [:index, :show]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy,:create]

end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


namespace :admin do
  # 管理者用
  get '/' => 'homes#top'
  get '/admin/orders/:id' => 'orders#show', as: :order
  
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]


end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

