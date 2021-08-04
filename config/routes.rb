Rails.application.routes.draw do
  resources :books do
    member do
      patch :change_status
      patch :change_privacy
    end
  end
end
