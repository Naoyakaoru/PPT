class User < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_password

private
def encrypt_password

end
