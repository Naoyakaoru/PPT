class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_password

  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account],
      password: Digest::SHA1.hexdigest("x" + options[:password] + "y"))
    else
      return false
    end
  end
  #User.login

  private
  def encrypt_password
    self.password = wara(self.password)
  end

  def wara(string) #add salt
    string = "x" + string + "y"
    Digest::SHA1.hexdigest(string)
  end
end
