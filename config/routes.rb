Rails.application.routes.draw do

  resources :categories
  devise_for :users
  root 'pages#index'
  get 'blog', to: 'posts#index'
  
  resources :posts, except: [:index] do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
