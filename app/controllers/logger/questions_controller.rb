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

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(updated_at: :asc)
  end

  def favorite
    @question = Question.find(params[:id])
    Favorite.create(user:current_user,question:@question)
    redirect_back(fallback_location: logger_root_path)  # 導回上一頁
  end

  def unfavorite
    @question = Question.find(params[:id])
    @unfavorite = Favorite.where(user:current_user,question:@question).first
    @unfavorite.destroy
    redirect_back(fallback_location: logger_root_path)  # 導回上一頁
  end


  private
  def question_params
    params.require(:question).permit(:topic,:content)
  end
end
