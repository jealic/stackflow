class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(created_at: :asc)
  end

  def resetpwd
    @user = User.find(params[:id])
    @user.update(password: "123456")
    if @user!=current_user
      flash[:notice] = "個人一鍵更改密碼成功, 該使用者的密碼為 123456, 請重新登入"
      redirect_back(fallback_location: root_path)  # 導回上一頁
    else
      flash[:notice] = "個人一鍵更改密碼成功, 您的密碼為 123456, 請重新登入"
      redirect_to root_path  
    end
  end

end
 