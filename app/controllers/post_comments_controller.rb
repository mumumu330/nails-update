class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_image_id = @post_image.id
    if @comment.save
    respond_to do |format|
      format.html { redirect_to post_image_path(@post_image.id) }
      format.json { render json: { post_comments: @comment } }
    end
  end
    # render post_image_path
    # redirect_to post_image_path(@post_image.id)
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_image = @post_comment.post_image
    if @post_comment.user != current_user
      # render "destroy"
    end
    @post_comment.destroy
    # render "destroy"
    # redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
