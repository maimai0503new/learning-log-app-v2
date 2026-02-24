class MakeTitleNotNullOnPosts < ActiveRecord::Migration[8.1]
  def up
    # 既存のPostレコードに対して、contentの先頭をtitleにコピーする
    Post.where(title: nil).find_each do |post|
      post.update_columns(title: post.content.truncate(100))
    end
    change_column_null :posts, :title, false
  end

  def down
    change_column_null :posts, :title, true
  end
end
