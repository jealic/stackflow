class Logger::AnswersController < Logger::BaseController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:notice]="成功回答"
      redirect_to logger_question_path(@question)
    else
      flash[:alert]="回答失敗，請填入留言內容"
      redirect_to logger_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id]) 
    if current_user==@answer.user
      @answer.destroy
      flash[:alert]="successfully deleted"
      redirect_to logger_question_path(@question)
    end  
  end 

  private
  def answer_params
    params.require(:answer).permit(:content) 
  end
end 
