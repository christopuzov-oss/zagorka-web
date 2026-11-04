class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.integer :position
      
      t.timestamps
    end
  end
end
