Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions , :users 
  resources :categories do
    resources :clothes
  end

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
