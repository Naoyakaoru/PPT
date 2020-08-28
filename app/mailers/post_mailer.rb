class PostMailer < ApplicationMailer
  def poster #在這裡定義的方法都會變成類別方法
    post = params[:post]
    mail to: 'naoyakaoru@gmail.com', subject: "#{post.title}"
  end
end
