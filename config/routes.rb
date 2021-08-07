Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get '/user/books', to: 'users#books'
  get '/user/profile', to: 'users#profile'
  root to: "books#index"

  resources :books do
    resources :comments, module: :books
    member do
      patch :change_status
      patch :change_privacy
    end
  end
end
