Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "/about", to: "pages#about"
  get "/pricing", to: "pages#pricing"
  get "/payment", to: "pages#payment"
  post "/checkout", to: "pages#checkout"

  resources :mailboxes do
    collection do
      get :draft
      get :sent
    end

    member do
      post :send
    end
  end

  resources :boards do
    resources :posts, shallow: true do
      resources :comments, shallow: true, only: [:create]
    end

    member do
      post :favorite
      put :hide
    end

  end

  # resources :favorites, except: [:show, :edit] #不需要就不要開
    resources :favorites, only: [:index]

  resources :users, only: [:create] do #想要有自己的網址，就可以把:new刪掉，自己在下面建立
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out #也可以用get, 但可以想成是刪除session
    end
  end

  namespace :api do
    namespace :v1 do
      resources :boards, only: [:index]
    end
  end

end
