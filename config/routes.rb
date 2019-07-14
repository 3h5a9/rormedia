Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :categories
  devise_for :users
  
  root 'pages#index'
  
  get 'blog', to: 'posts#index'
  
  get 'contact', to: 'pages#contact'

  resources :posts, except: [:index] do
    resources :comments
  end

  resources :messages, only: [:create]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
