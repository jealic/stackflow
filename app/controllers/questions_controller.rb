class QuestionsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :favorite, :unfavorite, :upvote, :downvote]
  before_action :set_question, only: [:upvote, :downvote, :show, :favorite, :unfavorite, :destroy]

  def index
    @question = Question.new
    @questions = Question.order(created_at: :desc).page(params[:page]).per(10)
    @hashtags = Hashtag.all
    @hashtag = Hashtag.new
    @q_tagships = @question.q_tagships
  end

  def create
    @question = Question.create(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = "question was successfully created"
      redirect_to questions_path
    else
      flash[:alert] = "question was failed to created, content can't be blank"
      redirect_to questions_path
    end

  end

  def destroy
    if current_user || current_user.admin? 
      if @question.destroy
        flash[:notice] = "question was successfully deleted"
        redirect_to root_path
      end
    end
  end

  def show
    
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(10)
  end

  def favorite
    
    Favorite.create(user:current_user,question:@question)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    
    @unfavorite = Favorite.where(user:current_user,question:@question).first
    @unfavorite.destroy
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def upvote
    
    @question.upvotes.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def downvote
    
    upvotes = Upvote.where(question: @question, user: current_user)
    upvotes.destroy_all
    redirect_back(fallback_location: root_path)
  end




  private
  
  def question_params
    params.require(:question).permit(:topic,:content, :hashtag_ids => [])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end

 