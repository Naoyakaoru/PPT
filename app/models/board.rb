class Board < ApplicationRecord
  acts_as_paranoid
  
  validates :title, presence: true, length: { minimum: 2 }

  has_many :posts
  has_many :board_masters
  has_many :users, through: :board_masters

  has_many :favorite_boards
  has_many :favorited_users, through: :favorite_boards, source: :user

  default_scope { where(deleted_at: nil) }

  def destroy #也可以做一個軟刪除模組，掛在有需要的Model身上
    update(deleted_at: Time.now)
  end

  def favorited_by?(u)
    favorited_users.include?(u)
  end

  include AASM

  aasm(column: 'state') do
    state :normal, initial: true
    state :hidden, :locked

    event :hide do
      transitions from: [:normal, :locked], to: :hidden
    end

    event :show do
      transitions from: :hidden, to: :locked
    end

    event :lock do
      transitions from: [:normal, :hidden], to: :locked

      after_transaction do
        puts "已鎖板！"
      end
    end

    event :unlock do
      transitions from: :locked, to: :normal
    end
  end

end
