class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def  my_friends 
    @friends = current_user.friends 
  end 

  def search 
      if params[:friend].present?
              @friend = User.search(params[:friend])
              if @friend
                respond_to do |format|
                      format.js { render partial: 'users/friend_result'}
                  end
              else  
                  respond_to do |format|
                      flash.now[:alert] = "Couldn't find user"
                      format.js { render partial: 'users/friend_result'}
                  end 
              end 
          else  
                  respond_to do |format|
                      flash.now[:alert] = "Please enter a valid name or email."
                      format.js { render partial: 'users/friend_result'} 
                  end 
          end
    end 


    def add_friend 
        friend = User.find(params[:friend])
        current_user.friends << friend 
        current_user.save 
        redirect_to 'users/my_friends'
    end 

    def remove_friend 
        friend = User.find(params[:friend])
        current_user.friends.delete(friend)
        current_user.save 
        redirect_to 'users/my_friends'

    end 

end
