# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rooms
  resources :admins, controller: 'users', type: 'Admin'
  resources :teachers, controller: 'users', type: 'Teacher'
  resources :users
  resources :students, controller: 'users', type: 'Student'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
