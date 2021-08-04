Rails.application.routes.draw do
  devise_for :users

  get '/user/books', to: 'users#books'
  resources :books do
    member do
      patch :change_status
      patch :change_privacy
    end
  end
end
