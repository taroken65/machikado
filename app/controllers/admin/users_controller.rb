class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @topics = Topic.where(user_id: @user)
    @comments = Comment.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   user = User.find(params[:id])
   user.update(user_params)
   redirect_to admin_user_path(user)
  end

  def today
   @users = User.all
   @today_users =  @users.created_today.page(params[:page]).reverse_order
  end

  def yesterday
   @users = User.all
   @yesterday_users =  @users.created_yesterday.page(params[:page]).reverse_order
  end

  def thisweek
   @users = User.all
   @this_week_users =  @users.created_this_week.page(params[:page]).reverse_order
  end

  def lastweek
   @users = User.all
   @last_week_users =  @users.created_last_week.page(params[:page]).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :is_deleted)
  end
end
