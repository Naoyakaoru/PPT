class SendmailJob < ApplicationJob
  queue_as :default

  #SendmailJob.perform_later(@post) <- 目標要能這樣使用
  def perform(post)
    puts "------------------------------"
    puts "寄信囉!!"
    puts "------------------------------"
    PostMailer.with(post: post).poster.deliver_now
  end
end
