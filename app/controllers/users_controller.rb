class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posted_questions = @user.questions.order(upvotes_count: :desc).limit(10)
    @answers = @user.answers.order(upvotes_count: :desc).limit(10)
    @favorited_questions = @user.favorites.order(created_at: :desc).limit(10)
    @question_upvotes = @posted_questions.map(&:upvotes_count).sum
    @answer_upvotes = @answers.map(&:upvotes_count).sum
    @total_upvotes = @question_upvotes + @answer_upvotes
    
  end

  def edit
    @user = User.find(params[:id])
    if current_user == current_user.admin?
      unless @user == current_user
        redirect_to user_path(@user)      
      end
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

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      if @user.destroy
        flash[:notice]="user has been deleted"
        redirect_to admin_root_path
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        redirect_to admin_root_path
      end
    end
  end 

  def favoriteboard
    @user = User.find(params[:id])
    if @user == current_user
      @favorited_questions = @user.favorited_questions.order(created_at: :desc).page(params[:page]).per(10)
    else
      flash[:alert]="you are not authenticated to view this page"
      redirect_to root_path
    end
  end

  def update_password
   @user = User.find(current_user.id)
      
      @user.update_without_password(params[:user])
    

  end


  private

  def user_params
    params.require(:user).permit(:name, :intro, :image, :company, :title, :website, :twitter, :github)
  end

end
