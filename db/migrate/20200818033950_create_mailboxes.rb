class CreateMailboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :mailboxes do |t|
      t.string :from
      t.string :title
      t.text :content
      t.string :ip_address
      t.datetime :read_at
      t.datetime :deleted_at
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :mailbox, null: false, foreign_key: true,  default: 0

      t.timestamps
    end
    add_index :mailboxes, :deleted_at
  end
end
