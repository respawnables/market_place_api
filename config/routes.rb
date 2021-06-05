# frozen_string_literal: true

Rails.application.routes.draw do
  # API definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :tokens, only: %i[create]
      resources :products
      resources :orders, only: %i[index show create]
    end
  end
end
