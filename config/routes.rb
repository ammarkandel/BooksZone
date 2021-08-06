Rails.application.routes.draw do
  devise_for :users

  root to: 'books#index'
  get '/user/books', to: 'users#books'

  resources :books, except: [:index] do
    resources :comments, module: :books
    member do
      patch :change_status
      patch :change_privacy
    end
  end
end
