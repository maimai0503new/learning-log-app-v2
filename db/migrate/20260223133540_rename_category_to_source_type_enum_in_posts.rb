class RenameCategoryToSourceTypeEnumInPosts < ActiveRecord::Migration[8.1]
  def change
    rename_column :posts, :category, :source_type_enum
  end
end
