Rails.application.routes.draw do
  namespace :staff do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    post 'sesson' => 'sessons#create', as: :session
    delete 'sesson' => 'session#destory'
  end

  namespace :admin do
    root 'top#index'
  end

  namespace :customer do
    root 'top#index'
  end

  # デフォルトで設定されているルートURLパス(/)の更新
  root 'errors#routing_error'

  # 上記以外の任意のURL(*anything)の設定
  get '*anything' => 'errors#routing_error'
end
