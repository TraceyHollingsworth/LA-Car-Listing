Rails.application.routes.draw do
  resources :manufacturers, only: [:new, :create, :index]
end
