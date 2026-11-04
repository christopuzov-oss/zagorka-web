class AddPublishDateToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publish_at, :datetime #, null: false
    Article.all.each{|a| a.update_attributes(publish_at: a.created_at)}
  end
end
