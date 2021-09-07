class User::UsersController < ApplicationController
    def show
      @user = current_user
    end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
