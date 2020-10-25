class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_image_id = @poent_user, @comment.id)
    end
    # redirect_to post_image_path(@post_image.id)
  end


  def create
    @item = Item.find(params[:item_id])
    #投稿に紐づいたコメントを作成
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_item = @comment.item
    if @comment.save
      #通知の作成
      @comment_item.create_notification_comment!(current_user, @comment.id)
      render :index
    end
end






  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_image = @post_comment.post_image
    if @post_comment.user != current_user
      # render "destroy"
    end
    @post_comment.destroy
    @post_comments = PostComment.where(post_image_id: @post_image.id)
    # render "destroy"
    # redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
