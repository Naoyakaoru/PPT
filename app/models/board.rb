class Board < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }

  def destroy #也可以做一個軟刪除模組，掛在有需要的Model身上
    update(deleted_at: Time.now)
  end

end
