class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.string     :name
      t.string     :slug, unique: true
      t.string     :summary
      t.text       :content
      t.integer    :position

      t.text       :meta_description
      t.string     :meta_keywords

      t.bigint  :picture_id, index: true
      t.bigint  :logo_id, index: true

      t.timestamps
    end
    add_foreign_key :products, :ckeditor_assets, column: :picture_id
    add_foreign_key :products, :ckeditor_assets, column: :logo_id
  end
end
