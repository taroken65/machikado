Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'user/homes#top'
get "about" => "user/homes#about"

# 会員側のルーティング設定
 devise_for :users,controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'}

 scope module: :user do
  resources :users, only: [:show,:edit,:update]
  resources :topics, only: [:index,:show,:new,:create,:destroy] do
    resources :comments, only: [:create, :destroy]
  end
 end



# 管理者側のルーティング設定
 devise_for :admins,controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'}

 namespace :admin do
  resources :categories, :except => [:new,:show,:destroy]
  resources :ages, :except => [:new,:show,:destroy]
 end
end
