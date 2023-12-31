class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users=User.all
  end


  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end
  
  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end
  


  def show
    @user = User.find_by_id(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end

private
def user_params
  params.require(:user).permit(:name, :email, :avatar)
end