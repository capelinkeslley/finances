# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'financials#index', as: :authenticated_root
  end

  resources :financials, only: %i[index show]

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end
end
