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
  get '/search', to: 'searches#search'
  resources :users, only: [:show,:edit,:update]
  resources :topics, only: [:index,:show,:new,:create,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    end
  get 'topics/category/:id', to: 'topics#category' , as: 'topic/category'
  get 'topics/age/:id', to: 'topics#age' , as: 'topic/age'
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
 end



# 管理者側のルーティング設定
 devise_for :admins,controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'}

 namespace :admin do
  resources :categories, :except => [:new,:show,:destroy]
  resources :ages, :except => [:new,:show,:destroy]
  resources :topics, only: [:index,:show,:destroy]
  resources :users, only: [:index,:show,:edit,:update,:destroy]
  resources :comments, only: [:index,:show,:destroy]
  get '', to: 'topics#top'
  get 'topic/today', to: 'topics#today', as: 'topic/today'
 end
end
