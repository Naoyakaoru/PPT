class Post < ApplicationRecord
  validates :title, presence: true
  validates :serial, uniqueness: true

  belongs_to :board
  belongs_to :user
  has_many :comments

  before_create :create_serial #before_validation -> 須確認是否是新資料

  def display_user_name
    user.nil? ? "-" : user.account
  end

  private
  def create_serial
    puts "-----"
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
