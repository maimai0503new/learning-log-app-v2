class CreateBookMetadata < ActiveRecord::Migration[8.1]
  def change
    create_table :book_metadata do |t|
      t.string :title
      t.string :author
      t.string :ndc_code
      t.string :ndc_label

      t.timestamps
    end
  end
end
