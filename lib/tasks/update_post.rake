namespace :db do
  desc "更新文章序號"
  task :update_post_serial => :environment do
    puts "----------"
    puts " updating "
    puts "----------"
    Post.where(serial: nil).each do |p|
      p.update!(serial: serial_generator(10))
      print "."
    end
     puts "All Done!"
  end

  private
  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *'0'..'9'].sample(n).join
  end

end