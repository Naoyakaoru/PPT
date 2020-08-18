class MailboxPolicy < ApplicationPolicy
  def show? #顯示
    if owner(a)
      true
    else
      false
    end
  end

  def update? #編輯 更新 刪除 只能針對draft
    if mailbox.state == 'draft' && owner(a)
      true
    else
      false
    end
  end
end