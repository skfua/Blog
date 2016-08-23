Rails.application.routes.draw do

  root to: "articles#index"

  devise_for :users

  # get '/', to: 'home#index'

  resources :articles do
    resources :comments, only: [:create]
  end

  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
