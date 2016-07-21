class Api::SessionsController < ApplicationController
  def create
    username = session_params[:username]
    password = session_params[:password]

    @user = User.find_by_credentials(username, password)
    if @user
      set_current_user(@user)
      render 'api/users/user'
    else
      render json: {'message': 'Invalid username or password'}, status: 422
    end
  end

  def destroy
    current_user.try(:reset_session_token!)
    logout!
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
