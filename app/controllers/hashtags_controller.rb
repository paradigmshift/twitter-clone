class HashtagsController < ApplicationController

  def show
    @statuses = Status.where("body LIKE ?", "%#{params[:id]}%")
    @header = params[:id]
  end

end
