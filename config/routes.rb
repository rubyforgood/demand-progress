# frozen_string_literal: true

Rails.application.routes.draw do
  resources :organizations
  resources :events, :only => %i[index show]
  root to: "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
