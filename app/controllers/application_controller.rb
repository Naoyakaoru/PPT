class ApplicationController < ActionController::Base
  include Pundit

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :user_signed_in?, :current_user #提供方法給view用
  # before_action :find_user

  private
  # def find_user #全站共用的功能/view，就要把功能寫在這
  #   if session[:user_token]
  #   @current_user = User.find(session[:user_token])
  #   end
  # end
  def user_signed_in? #讓每個方法只做一件事就好，本方法只檢查是否有登入
    current_user != nil
  end
  
  def current_user #有登入的話就可以執行取資料
    @current_user ||= User.find_by(id: session[:user_token])
  end

  def not_found
    render file: '/public/404.html', status: 404, layout: false #不要套用公版layout, 因為會有navbar
  end

  def authenticate_user!
    redirect_to root_path, notice: "請登入會員" if not user_signed_in?
  end

end
