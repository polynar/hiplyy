Rails.application.routes.draw do

  scope "(:locale)", locale: /hu|en/ do
    devise_for :users

    authenticated :user do
      root to: 'home#index'
      resources :users, only: [:show, :edit, :update]
      resources :posts, only: [:new, :create, :show, :destroy]
      get 'search' => 'search#index'
    end

    devise_scope :user do
      root to: 'devise/sessions#new'
    end

  end

end
