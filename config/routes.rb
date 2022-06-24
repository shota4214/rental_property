Rails.application.routes.draw do
  resources :properties
  resources :stations, only:[:new, :show, :edit, :index]
end
