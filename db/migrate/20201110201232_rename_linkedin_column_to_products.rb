class RenameLinkedinColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :linkedin_link, :instagram_link
  end
end
