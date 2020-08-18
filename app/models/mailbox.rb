class Mailbox < ApplicationRecord
  acts_as_paranoid

  validates :to, :title, :content, presence: true
  
  default_scope { where(deleted_at: nil) }

  belongs_to :user
  belongs_to :reply

  has_many :replies

  def destroy #也可以做一個軟刪除模組，掛在有需要的Model身上
    update(deleted_at: Time.now)
  end

  include AASM
  
  aasm(column: 'state') do
    state :draft, initial: true
    state :sent
  end

  event :send do
    transitions from :draft, to :sent
  end
end
