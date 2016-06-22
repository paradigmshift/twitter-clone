class StatusesController < ApplicationController

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.creator_id = session[:user_id]

    if @status.save
      flash[:notice] = "Status tweeted!"
      redirect_to user_path(@status.creator.username)
    else
      render 'new'
    end
  end

  private

  def status_params
    params.require(:status).permit(:body)
  end

end
