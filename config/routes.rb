Rails.application.routes.draw do

  # 顧客用
root 'public/homes#top'
get 'about' => 'public/homes#about'
get 'items' => 'public/items#index'
get '/items/:id' => 'public/items#show'
get '/customers/mypage' => 'public/customers#show'
get '/customers/information/edit' => 'public/customers#edit'
get '/customers/check' => 'public/customers#check'
get '/cart_items' => 'public/cart_items#index'
get '/orders/new' => 'public/orders#new'
get '/orders' => 'public/orders#index'
get '/orders/:id' => 'public/orders#show'

patch  '/customers/withdraw' => 'public/customers#withdraw'

#resources :customers, only: [:show, :edit, :check]

devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
get 'admin' => 'admin/homes#top'
get 'admin/items' => 'admin/items#index'
get 'admin/items/new' => 'admin/items#new'
get 'admin/items/:id' => 'admin/items#show'
get '/admin/items/:id/edit' => 'admin/items#edit'
get 'admin/customers' => 'admin/customers#index'
get '/admin/customers/:id' => 'admin/customers#show'
get '/admin/customers/:id/edit' => 'admin/customers#edit'
get 'admin/orders/:id' => 'admin/orders#show'

post '/admin/items' => 'admin/items#create'

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

