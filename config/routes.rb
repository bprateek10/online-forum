Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  root to: 'questions#index'

  resources :questions do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

end
