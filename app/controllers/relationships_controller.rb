class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def follow
    current_user.follow(params[:id])
    redirect_to root_path

    #通知の作成
    @user = User.find(params[:follower_id])
    @user.create_notification_follow!(current_user)
    redirect_to root_path
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
end
