Rails.application.routes.draw do
  get 'events/index'
  resources :committees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
