class SlidersSlides < ActiveRecord::Migration[5.2]
  
  def change
    create_table :sliders_slides do |t|
      t.belongs_to :slide, index: true
      t.belongs_to :slider, index: true
    end
  end
  
end