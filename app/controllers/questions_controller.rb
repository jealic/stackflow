class QuestionsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :favorite, :unfavorite, :upvote, :downvote]
  before_action :set_question, only: [:upvote, :downvote, :show, :favorite, :unfavorite]

  def index
    @question = Question.new
    @questions = Question.order(created_at: :desc)
  end

  def create
    @question = Question.create(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = "question was successfully created"
      redirect_to logger_questions_path
    else
      flash[:alert] = "question was failed to created"
      render :index
    end
  end

  def show
    
    @answer = Answer.new
    @answers = @question.answers.order(updated_at: :asc)
  end

  def favorite
    
    Favorite.create(user:current_user,question:@question)
    redirect_back(fallback_location: logger_root_path)  # 導回上一頁
  end

  def unfavorite
    
    @unfavorite = Favorite.where(user:current_user,question:@question).first
    @unfavorite.destroy
    redirect_back(fallback_location: logger_root_path)  # 導回上一頁
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
    params.require(:question).permit(:topic,:content)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end

 