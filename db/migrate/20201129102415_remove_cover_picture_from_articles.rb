class RemoveCoverPictureFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_index :artices, :cover_picture_id
    remove_column :artices, :cover_picture_id
  end
end
