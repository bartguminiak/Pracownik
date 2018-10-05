Rails.application.routes.draw do
  resources :employees, only: [:index, :show, :create]
end
