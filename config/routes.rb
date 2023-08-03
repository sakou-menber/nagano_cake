Rails.application.routes.draw do

  # 顧客用
root 'public/homes#top'
get 'about' => 'public/homes#about'
get 'items' => 'public/items#index'

devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
get 'admin' => 'admin/homes#top'
get 'admin/items' => 'admin/items#index'
get 'admin/items/new' => 'admin/items#new'
get 'admin/customers' => 'admin/customers#index'
get '/admin/customers/:id' => 'admin/customers#show'
get '/admin/customers/:id/edit' => 'admin/customers#edit'
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

