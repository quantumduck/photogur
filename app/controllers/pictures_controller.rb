class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    # make a new picture with what picture_params returns (which is a method we're calling)
    @picture = Picture.new(picture_params_alt)
    # @picture = Picture.new  # Alternate method
    # @picture.title = params[:title]
    # @picture.url = params[:url]
    # @picture.artist = params[:artist]
    if @picture.save
      # if the save for the picture was successful, go to index.html.erb
      redirect_to pictures_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
    # render text: "Saving a picture. "\
    #              "URL: #{params[:url]}, "\
    #              "Title: #{params[:title]}, "\
    #              "Artist: #{params[:artist]}"
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

private

  def picture_params
    # params sanitation method (only works for form_for)
    params.require(:picture).permit(:artist, :title, :url)
  end

  def picture_params_alt
    # params sanitation method (only works for form_tag)
    params.permit(:artist, :title, :url)
  end

end
