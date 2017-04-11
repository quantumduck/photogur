Rails.application.routes.draw do

  root 'pictures#index'

  get '/artists' => 'pictures#artists'

  get '/artists/:name' => 'pictures#artist', as: 'artist'

  resources :pictures # automagically adds all the routes below:
  # get 'pictures' => 'pictures#index'
  # get 'pictures/new' => 'pictures#new'
  # get 'pictures/:id' => 'pictures#show', as: 'picture'
  # get 'pictures/:id/edit' => "pictures#edit", as: "edit_picture"
  #
  # post 'pictures' => 'pictures#create'
  # patch 'pictures/:id' => "pictures#update"
  # delete 'pictures/:id' => 'pictures#destroy', as: "delete_picture" # if you use this, you need

  get 'pictures/:id/comments' => 'comments#index'
                                                                      # delete_picture_path(@picture)
  post 'pictures/:id/comments' => 'comments#create', as: 'comments'

  delete 'pictures/:id/comments/:comment_id' => 'comments#destroy', as: 'comment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
