module UsersHelper
  def user_signed_in? #讓每個方法只做一件事就好，本方法只檢查是否有登入
    session[:user_token]
  end
  
  def current_user #有登入的話就可以執行取資料
    if user_signed_in?
      User.find(session[:user_token])
    end
  end

  def logout
    session[:user_token] 
  end
end
