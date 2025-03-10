Rails.application.routes.draw do
   devise_for :users
   root to: 'home#top'
   get 'home/about' => 'home#about', as: 'about'


  resources :users, only:[:index, :show, :edit, :update, :create]
  resources :books, only:[:new, :index, :show, :create, :edit, :update, :destroy]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
