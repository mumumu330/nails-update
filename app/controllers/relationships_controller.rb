class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def follow
    @user = User.find(params[:follower_id])
    current_user.follow(@user)
    redirect_to root_path
    #通知の作成
    @user.create_notification_follow!(current_user)
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
end
