class CreateIrregularities < ActiveRecord::Migration[5.2]
  def change
    create_table :irregularities do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.text :message, null: false

      t.boolean :tos, null: false

      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
  end
end
