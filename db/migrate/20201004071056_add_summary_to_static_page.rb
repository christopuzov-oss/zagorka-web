class AddSummaryToStaticPage < ActiveRecord::Migration[5.2]
  def change
    add_column :static_pages, :summary, :string
  end
end
