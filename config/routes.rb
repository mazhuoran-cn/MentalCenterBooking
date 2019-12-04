# frozen_string_literal: true

Rails.application.routes.draw do
  #get 'static_pages/home'
  #get 'static_pages/help'
  resources :rooms
  resources :admins, controller: 'users', type: 'Admin'
  resources :teachers, controller: 'users', type: 'Teacher'
  resources :users
  resources :students, controller: 'users', type: 'Student'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
