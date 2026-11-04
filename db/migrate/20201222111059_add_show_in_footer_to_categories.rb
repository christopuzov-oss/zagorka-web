class AddShowInFooterToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :show_in_footer, :boolean, default: false
  end
end
