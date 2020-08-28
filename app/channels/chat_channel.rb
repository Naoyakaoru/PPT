class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
    puts "-----------------------------"
    puts "hello subscribe"
    puts "-----------------------------"
  end

  def receive(data)
    puts "-----------------------------"
    puts "hello received"
    puts "-----------------------------"
    ActionCable.server.broadcast("chat_#{params[:room]}", data)
i
  end
end