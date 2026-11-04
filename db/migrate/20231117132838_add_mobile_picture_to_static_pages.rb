class AddMobilePictureToStaticPages < ActiveRecord::Migration[5.2]
  def change
    add_column :static_pages, :mobile_picture_id, :bigint, index: true
    add_column :static_pages, :banner_url, :string
  end
  add_foreign_key :static_pages, :ckeditor_assets, column: :mobile_picture_id
end
