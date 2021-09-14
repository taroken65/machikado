class User::UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @topics = Topic.where(user_id: @user)
      @comments = Comment.where(user_id: @user)
    end

    def edit
      @user = current_user
    end

    def update
      user = current_user
      user.update(user_params)
      redirect_to user_path(current_user)
    end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
end
