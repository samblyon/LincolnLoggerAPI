class Api::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.save
      set_current_user(@user)
      render :show
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
