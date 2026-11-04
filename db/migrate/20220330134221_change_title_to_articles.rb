class ChangeTitleToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :title, :string, null: true
    change_column :articles, :content, :text, null: true
  end
end
