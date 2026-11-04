class CreateStaticPages < ActiveRecord::Migration[5.2]
  def change
    create_table :static_pages do |t|

      t.string     :title
      t.string     :slug, unique: true
      t.text       :content
      t.integer    :position
      t.text       :meta_description
      t.string     :meta_keywords

      t.bigint  :picture_id, index: true
      t.bigint  :category_id, index: true

      t.timestamps
    end
    add_foreign_key :static_pages, :ckeditor_assets, column: :picture_id
    add_foreign_key :static_pages, :categories, column: :category_id, on_delete: :cascade, on_update: :cascade
  end
end
