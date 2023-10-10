# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'home', to: 'home#leading_page'

  # Isso define a rota para a raiz do seu domínio [seu_dominio]/
  root 'home#leading_page'
end
