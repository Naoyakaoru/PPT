class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :user_signed_in?, :current_user #提供方法給view用
  # before_action :find_user

  private
  # def find_user #全站共用的功能/view，就要把功能寫在這
  #   if session[:user_token]
  #   @current_user = User.find(session[:user_token])
  #   end
  # end
  def user_signed_in? #讓每個方法只做一件事就好，本方法只檢查是否有登入
    session[:user_token]
  end
  
  def current_user #有登入的話就可以執行取資料
    if user_signed_in?
      User.find(session[:user_token])
    end
  end

  def not_found
    render file: '/public/404.html', status: 404
  end
end
