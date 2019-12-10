# frozen_string_literal: true

Rails.application.routes.draw do
  #devise_for :teachers
  #devise_for :students
  devise_for :students, controllers: {
      sessions: 'students/sessions',
      registrations: 'students/registrations'
  }
  devise_for :teachers, controllers: {
      sessions: 'teachers/sessions',
      registrations: 'teachers/registrations'
  }
  devise_scope :students do
    get 'student_sign_in', to:'students/sessions#new'
    get 'student_sign_up', to:'students/registrations#new'
    get 'student_forgot_password', to:'students/passwords#new'
    get 'student_reset_password', to:'students/password#edit'
    get 'student_home', to:'pages#student_home'
  end
  devise_scope :teachers do
    get 'teacher_sign_in', to:'teachers/sessions#new'
    get 'teacher_sign_up', to:'teachers/registrations#new'
    get 'teacher_forgot_password', to:'teachers/passwords#new'
    get 'teacher_reset_password', to:'teachers/password#edit'
    get 'teacher_home', to:'pages#teacher_home'
  end
  #get 'static_pages/home'
  #get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  resources :locations, only: [:create, :destroy]
end
