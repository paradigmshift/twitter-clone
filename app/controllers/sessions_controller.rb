class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(@user.username)
    else
      flash[:warning] = "There was a problem, please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
