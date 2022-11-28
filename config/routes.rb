Rails.application.routes.draw do
  root :to =>"homes#top"
  devise_for :users

  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users
  resources :group_chats
  resources :group_members
  resources :tags
  resources :tag_lists
  get 'user/belong_to_group/:id' => 'users#belong_to_group', as: 'belong_to_group'
  get 'group/chat/:id' => 'groups#chat', as: 'chat_room'
  get 'search' => 'searches#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
