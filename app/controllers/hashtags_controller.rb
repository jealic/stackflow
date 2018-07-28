class HashtagsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update, :destory]
  before_action :set_hashtag, only: [:edit, :update, :destroy]
  
  def show
    @hashtags = Hashtag.all
    @hashtag = Hashtag.find(params[:id])
    @questions = @hashtag.questions.order(created_at: :desc).page(params[:page]).per(10)
    @question = Question.new
    @q_tagships = @question.q_tagships
  end 
  
  def create
     
    @hashtag = Hashtag.new(hashtag_params)
    if @hashtag.save
      flash[:notice] = "Just added a new tag."
    else
      @hashtags = Hashtag.all
    end
    
    redirect_to root_path
    
  end

  def update

    if @hashtag.update(hashtag_params)
      flash[:notice] = "Update tags."
    else
      @hashtags = Hashtag.all
    end
    redirect_to root_path
  end

  def destroy
    
    @hashtag.destroy
    flash[:alert] = "Deleted a tag: #{@hashtag.name}!"
    redirect_to root_path    
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:name)
  end

  def set_hashtag
    @hashtag = Hashtag.find(params[:id])
  end
end
