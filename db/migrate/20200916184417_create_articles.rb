class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug
      t.string :summary
      t.text :content, null: false
      t.integer :status, null: false, default: 0
      
      t.string     :meta_description
      t.string     :meta_keywords
      
      t.bigint  :picture_id, index: true
      t.bigint  :cover_picture_id, index: true
      
      t.timestamps
    end
    add_foreign_key :articles, :ckeditor_assets, column: :picture_id
    add_foreign_key :articles, :ckeditor_assets, column: :cover_picture_id
  end
end
