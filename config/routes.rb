Rails.application.routes.draw do
  devise_for :users
  resource :items do
    resources :records, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
end
