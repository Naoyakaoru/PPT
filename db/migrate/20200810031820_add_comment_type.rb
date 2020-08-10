class AddCommentType < ActiveRecord::Migration[6.0]
  def change
      add_column :comments, :comment_type, :string
  end
end
