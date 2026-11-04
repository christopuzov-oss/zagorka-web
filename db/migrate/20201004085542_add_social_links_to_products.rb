class AddSocialLinksToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :cover_picture_id,   :bigint,  index: true
    
    add_column :products, :facebook_link,      :string
    add_column :products, :youtube_link,       :string
    add_column :products, :linkedin_link,      :string
    add_column :products, :official_site_link, :string
    add_column :products, :store_link,         :string
    
    add_foreign_key :products, :ckeditor_assets, column: :cover_picture_id

  end
end
