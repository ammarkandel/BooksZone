Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get '/user/books', to: 'users#books'
  get '/user/profile', to: 'users#profile'
  root to: "books#index"

  resources :books, except: [:index] do
    resources :comments, module: :books
    member do
      patch :change_status
      patch :change_privacy
    end
  end

  match ':not_found' => redirect('/'), constraints: { :not_found => /.*/ }, via: [:get, :post]
end
