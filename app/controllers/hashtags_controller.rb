class HashtagsController < ApplicationController
  def show
    @hashtags = Hashtag.all
    @hashtag = Hashtag.find(params[:id])
    @questions = @hashtag.questions.order(created_at: :desc).page(params[:page]).per(10)
    @question = Question.new
    @q_tagships = @question.q_tagships
  end 
end  
 