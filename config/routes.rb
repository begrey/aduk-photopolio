Rails.application.routes.draw do
  

  #마이페이지
  get 'mypage/mypage'
  #성격입력
  get 'character/new' => 'mypage#chanew'
  post 'character/create' => 'mypage#chacreate'

  #스터디그룹
  get 'stu/new'
  post 'stu/create'
  get 'stu/index'
  get 'stu/show/:stu_id' => 'stu#show'
  get 'stu/delete/:stu_id' => 'stu#delete'
  get 'stu/edit/:stu_id' => 'stu#edit'
  post 'stu/update/:stu_id' => 'stu#update'
  
  #스터디그룹신청
  get 'stuapp/new/:stu_id' => 'stu#appnew'
  post 'stuapp/create/:stu_id' => 'stu#appcreate'
  get 'stuapp/index/:stu_id' => 'stu#appopen'
  get 'stuapp/appshow/:stu_id' => 'stu#appshow'
  get 'stuapp/appedit/:app_id' => 'stu#appedit'
  get 'stuapp/appdel/:app_id' => 'stu#appdelete'
  post 'stuapp/update/:app_id' => 'stu#appupdate'
  
  #교환게시판
  get 'trade/home'
  get 'trade/index/:post_id' => 'trade#index'
  get 'trade/new'
  post 'trade/create' => 'trade#create'
  get 'trade/edit/:post_id' => 'trade#edit'
  post 'trade/update/:post_id' => 'trade#update'
  get 'trade/delete/:post_id' => 'trade#delete'
  get 'post/:tradepost_id/tradescrap' => 'tradescrap#scrap_toggle'
  
  #교환게시판신청서 
  get 'apply/list/:post_id' => 'tradeapply#list'
  get 'apply/new/:post_id' => 'tradeapply#new'
  post 'apply/create/:post_id' => 'tradeapply#create'
  get 'apply/con/:apply_id/:post_id' => 'tradeapply#con'
  get 'apply/accept/:apply_id' => 'tradeapply#accept'
  get 'apply/edit/:apply_id/:post_id' => 'tradeapply#edit'
  post 'apply/update/:apply_id/:post_id' => 'tradeapply#update'
  get 'apply/delete/:apply_id/:post_id' => 'tradeapply#delete'
  
  #덕메찾기
  get '/matching/main'
  post '/matching/list'
  get '/matching/ok'
  post '/mateapply/:user_id/apply' => 'mateapply#apply'
  post '/mateapply/:user_id/accept/:apply_id' => 'mateapply#accept'

  resources :studies
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :installs
  devise_for :users
  root 'home#main'
  
  get 'home/index'
  get 'home/main'
  get 'posts/index'
  
  resources :posts
  post 'post/:post_id/like' => 'posts#like_toggle'
  resources :comments, only: [:create, :destroy]

  

end
