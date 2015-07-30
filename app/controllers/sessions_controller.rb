class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome #{ @user.username }"
      redirect_to @user
    else
      redirect_to login_path
      flash[:errors] = "Invalid information"
      # sad path - either user doesn't exist, or password is incorrect
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = "logged out"
    redirect_to login_path
  end
end