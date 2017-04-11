class CommentsController < ApplicationController

  def index
    # No get requests for comments. These are handled by PicturesController
    redirect_to picture_url(params[:id])
  end

  def create
    contents = params[:comment].to_s
    picture_ref = params[:id]
    @comment = Comment.new(contents: contents, picture: picture_ref)
    @comment.save
    redirect_to picture_url(picture_ref)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to picture_url(params[:id])
  end

end
