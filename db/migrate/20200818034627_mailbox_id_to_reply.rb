class MailboxIdToReply < ActiveRecord::Migration[6.0]
  def change
    rename_column :mailboxes, :mailbox_id, :reply_id
  end
end
