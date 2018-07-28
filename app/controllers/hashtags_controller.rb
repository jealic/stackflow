class HashtagsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destory]

  
  def create
    @hashtag = Hashtag.new(hashtag_params)
    if @hashtag.save
      flash[:notice] = "Just added a new tag."
    else
      @hashtags = Hashtag.all
    end
    redirect_to root_path
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:name)
  end
  
end
