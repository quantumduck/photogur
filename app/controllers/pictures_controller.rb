class PicturesController < ApplicationController
  def index
    # @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
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

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  def artists
    reditect_to_pictures_url
  end

  def artist
    @artist = params[:name]
    @pictures = Picture.where(artist: params[:name])
    if @pictures.length > 0

    else
      flash[:notice] = "There are no pictures by #{@artist} in the collection."
      redirect_to pictures_url
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
