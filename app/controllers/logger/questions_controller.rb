class Logger::QuestionsController < Logger::BaseController
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


  private
  def question_params
    params.require(:question).permit(:topic,:content)
  end
end
