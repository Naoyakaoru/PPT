class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if  @user.save
      #登入
      session[:user_token] = @user.id #id或account都可以，但注意是不可重複的
      redirect_to root_path, notice: '會員註冊成功' #去首頁
    else
     render :sign_up
    end
  end

  private
  def user_params
    params.require(:user).permit(:account, :password, :email)
  end

end
