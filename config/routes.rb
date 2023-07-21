# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :foods, only: %i[index]
end
