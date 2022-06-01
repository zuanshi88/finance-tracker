class FriendshipsController < ApplicationController
  def create
    friendship = User.find(params[:id])
    # current_user.friendships.build(params[:id])
    # build is another implementation
    current_user.friends << friendship 
    if current_user.save
      flash[:notice]
    else  
      flash[:alert] = "Something went wrong..."
    end  
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy 
    flash[:notice] = "Stopped Following"
    redirect_to my_friends_path
  end
end
