class AddStateToMail < ActiveRecord::Migration[6.0]
  def change
    add_column :mailboxes, :state, :string, default:'draft'
  end
end
