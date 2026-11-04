class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug, unique: true
      t.integer :position
      t.boolean :show_in_header, default: false

      t.timestamps
    end
  end
end
