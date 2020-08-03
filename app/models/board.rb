class Board < ApplicationRecord
  acts_as_paranoid
  
  validates :title, presence: true, length: { minimum: 2 }

  has_many :posts
  has_many :board_masters
  has_many :users, through: :board_masters

  default_scope { where(deleted_at: nil) }

  def destroy #也可以做一個軟刪除模組，掛在有需要的Model身上
    update(deleted_at: Time.now)
  end

end
