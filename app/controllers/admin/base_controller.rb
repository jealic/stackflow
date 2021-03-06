class Admin::BaseController < ApplicationController 
  before_action :authenticate_user!
  before_action :authenticate_admin

  private

    def authenticate_admin
      unless current_user.admin?
        flash[:alert] = "管理者才有權限進入!"
        redirect_to root_path
      end
    end
end
