# Photogur

This is the Bitmaker Imgur clone assignment. The repository was generated with
the command "rails new photogur".

rails command order and syntax:

1. add route
  get 'pictures' => 'pictures#index'

2. add controller
  rails generate controller pictures
  [=> class PicturesController < ApplicationController]

3. add method index to controller

4. add view
  views/pictures/index.html.erb

5. created Picture
  rails generate model Picture artist:string title:string url:string

6. migrate Picture class to database:
  rails db:migrate
  rails db:seed

7. for dynamic routes, use syntax (note that this creates picture_path(id) )
  get 'pictures/:id' => 'pictures#show', as: 'picture'



For now, there's nothing else to see here.
