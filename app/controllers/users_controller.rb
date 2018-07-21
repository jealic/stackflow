class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions.order(created_at: :desc).limit(10)
    @answers = @user.answers.order(created_at: :desc).limit(10)
    @favorited_questions = @user.favorites.order(created_at: :desc).limit(10)
    
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="Info successfully updated."
      redirect_to user_path(@user)
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :intro, :image, :company, :title, :website, :twitter, :github)
  end

end
