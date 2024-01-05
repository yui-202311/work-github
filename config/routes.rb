Rails.application.routes.draw do

  
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :edit, :show, :index, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  namespace :public do
    root to: 'homes#top'
    get "homes/about"=> "homes#about", as: "about"
    resources :items, only: [:show, :index]
    resources :customers, only: [:show, :edit, :update, :with_drawal, :unsubscribe]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
  end

  devise_for :users

  # resources public, only: [:create, :index, :show, :edit, :update, :destroy]
  # resources :admin, only: [:create, :new, :destroy]

  # patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
