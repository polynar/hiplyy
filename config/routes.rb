Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'home#index'
    devise_for :users
    resources :users, only: [:show, :edit, :update]

    resources :posts, only: [:new, :create, :show, :destroy]

    get 'search' => 'search#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
