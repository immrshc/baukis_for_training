Rails.application.routes.draw do
  namespace :staff do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
  end

  namespace :admin do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'session' => 'sessions#create', as: :session
    delete 'session' => 'sessions#destroy'
    resources :staff_members
  end

  namespace :customer do
    root 'top#index'
  end

  # update of default root path (/)
  root 'errors#routing_error'

  # setting of anyother url (*anything)
  get '*anything' => 'errors#routing_error'
end
