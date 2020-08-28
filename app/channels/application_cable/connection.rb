module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    private
    def find_verified_user
      if verified_user = User.find_by(id: session[:user_token])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end