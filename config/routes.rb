Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"
  get "/about", to: "pages#about"
  resources :boards do
    resources :posts, shallow: true do
      resources :comments, shallow: true, only: [:create]
    end

    member do
      post :favorite
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

end
