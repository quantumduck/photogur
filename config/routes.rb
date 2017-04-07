Rails.application.routes.draw do

  root 'pictures#index'

  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'

  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show', as: 'picture'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
