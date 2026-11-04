class CreateJobOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_offers do |t|

      t.string     :post
      t.string     :slug, unique: true
      
      t.string     :location
      t.string     :job_type
      t.integer    :position
      t.boolean    :active, default: false

      t.bigint  :picture_id, index: true

      t.timestamps
    end
    add_foreign_key :careers, :ckeditor_assets, column: :picture_id
  end
end
