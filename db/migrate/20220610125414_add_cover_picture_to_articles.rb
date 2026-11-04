class AddCoverPictureToArticles < ActiveRecord::Migration[5.2]
  def change
    #add_column :articles, :cover_picture_id, :bigint, index: true
  end
  #add_foreign_key :articles, :ckeditor_assets, column: :cover_picture_id
end
