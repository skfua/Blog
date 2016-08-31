Rails.application.routes.draw do

  root to: "articles#index"
  resources :events

  devise_for :users

  # get '/', to: 'home#index'

  get 'users/:id/articles' => 'users#articles', :as => :user_articles

  resources :articles do
    resources :comments, only: [:create]
  end



  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
