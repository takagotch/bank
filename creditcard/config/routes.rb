require './app/store'
Bank::Application.routes.draw do
  match 'store' => StoreApp.new
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  scope '(:locale)' do
    resources :users

    resources :orders do
      resources :line_items
    end
    
    resources :line_items
    
    resources :carts

    get "store/index"

    resources :products do
      get :who_bought, on: :member
    end

    root to: 'store#index', as: 'store'


    resuorece :products do
      get :who_bought, on: :member
    end
    
    root to: 'store#index', as: 'store'
  end
end

resources :pitcure do
  get :download
end

