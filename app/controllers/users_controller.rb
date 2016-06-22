class UsersController < ApplicationController
  before_action :require_user, only: [:follow]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "#{@user.username} user created!"
      redirect_to user_path(@user.username)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def follow
    user = User.find(params[:id])
    if user
      if current_user != user && !current_user.leaders.include?(user)
        current_user.leaders << user
        redirect_to user_path(user.username)
      else
        flash[:warning] = "An error occured"
        redirect_to user_path(current_user.username)
      end
    end
  end

  def unfollow
    user = User.find(params[:id])
    current_user.leaders.delete(user)
    redirect_to user_path(user.username)
  end

  def timeline
    @statuses = []
    current_user.leaders.each do |leader|
      @statuses << leader.statuses
    end if current_user.leaders.any?
    @statuses.flatten!
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
