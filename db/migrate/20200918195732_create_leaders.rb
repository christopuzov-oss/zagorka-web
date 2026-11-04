class CreateLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :leaders do |t|

      t.string     :name
      t.string     :slug, unique: true
      t.text       :content
      t.string     :post
      t.integer    :position

      t.text       :meta_description
      t.string     :meta_keywords

      t.bigint  :picture_id, index: true

      t.timestamps
    end
    add_foreign_key :leaders, :ckeditor_assets, column: :picture_id
  end
end
