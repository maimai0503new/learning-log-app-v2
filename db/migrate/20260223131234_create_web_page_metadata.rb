class CreateWebPageMetadata < ActiveRecord::Migration[8.1]
  def change
    create_table :web_page_metadata do |t|
      t.string :url
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
