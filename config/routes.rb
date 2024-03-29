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
  resources :users, only: [:show,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  	end
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
  resources :topics, only: [:index,:show,:destroy] do
   resources :comments, only: [:destroy]
   end
  resources :users, only: [:index,:show,:edit,:update,:destroy] do
   get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  	end
  resources :comments, only: [:index]
  get '', to: 'topics#top'
  get 'topic/today', to: 'topics#today', as: 'topic/today'
  get 'topic/yesterday', to: 'topics#yesterday', as: 'topic/yesterday'
  get 'topic/thisweek', to: 'topics#thisweek', as: 'topic/thisweek'
  get 'topic/lastweek', to: 'topics#lastweek', as: 'topic/lastweek'
  get 'user/today', to: 'users#today', as: 'user/today'
  get 'user/yesterday', to: 'users#yesterday', as: 'user/yesterday'
  get 'user/thisweek', to: 'users#thisweek', as: 'user/thisweek'
  get 'user/lastweek', to: 'users#lastweek', as: 'user/lastweek'
  get 'comment/today', to: 'comments#today', as: 'comment/today'
  get 'topics/category/:id', to: 'topics#category' , as: 'topic/category'
  get 'topics/age/:id', to: 'topics#age' , as: 'topic/age'
 end
end
