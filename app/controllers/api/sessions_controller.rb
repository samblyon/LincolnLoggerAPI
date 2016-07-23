class Api::SessionsController < ApplicationController
  def create
    username = session_params[:username]
    password = session_params[:password]

    @user = User.find_by_credentials(username, password)
    if @user
      set_current_user(@user)
      render 'api/users/show'
    else
      render json: { errors: 'Invalid username or password'}, status: 401
    end
  end

  def destroy
    logout!
    render json: { message: 'Successfully logged out'}, status: 200
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
