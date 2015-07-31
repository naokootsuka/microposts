class UsersController < ApplicationController
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts #追加
    @followings = @user.following_users
    @followers = @user.followed_users
  end
  
  def new
    @user = User.new  #この行を追加
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" #ここを追加
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
   def edit
    @user = User.find(params[:id])
   end
   
  def update
     @user = User.find(params[:id])
     @user.update(profile_params)
     if @user.save
      flash[:success] = "Profileを更新しました" 
      redirect_to @user 
     else
      render 'edit'
     end
  end
  
  def following
    @user = User.find(params[:id])
    @followings = @user.following_users
  end
 
  def follower
    @user = User.find(params[:id])
    @followers = @user.followed_users
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def profile_params
      params.require(:user).permit(:name, :email, :profile, :area)
  end
end
