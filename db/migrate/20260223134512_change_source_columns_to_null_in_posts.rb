class ChangeSourceColumnsToNullInPosts < ActiveRecord::Migration[8.1]
  def change
    change_column_null :posts, :source_id, true
    change_column_null :posts, :source_type, true
  end
end
