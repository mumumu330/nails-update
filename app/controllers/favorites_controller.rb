class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    favorite = current_user.favorites.new(post_image_id: @post_image.id)
    favorite.save
    @post_image = PostImage.find(params[:post_image_id])
    #通知の作成
    @post_image.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: @post_image.id)
    favorite.destroy
  end

  
end
