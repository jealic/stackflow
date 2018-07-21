class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end
  
end
