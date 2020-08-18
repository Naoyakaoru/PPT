class Mailbox < ApplicationRecord
  belongs_to :user
  belongs_to :reply

  has_many :replies
end
