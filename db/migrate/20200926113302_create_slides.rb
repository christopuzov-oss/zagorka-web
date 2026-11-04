class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|

      t.string     :headline
      t.string     :summary
      t.string     :url
      t.string     :label  
      t.integer    :bullet, default: 0
      t.boolean    :right_align, default: false

      t.bigint  :picture_id, index: true

      t.timestamps
    end
    add_foreign_key :slides, :ckeditor_assets, column: :picture_id
  end
end
