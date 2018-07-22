class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
    if current_user.present?
      redirect_to logger_root_path 
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(updated_at: :asc)
  end

end
 