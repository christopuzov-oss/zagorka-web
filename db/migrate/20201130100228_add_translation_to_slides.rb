class AddTranslationToSlides < ActiveRecord::Migration[5.2]
  def change
    
    reversible do |dir|
      dir.up do
        Slide.create_translation_table!({
          headline: :string, 
          summary: :string, 
          label: :string
        }, {
          migrate_data: true
        })
      end

      dir.down do
        Slide.drop_translation_table! migrate_data: true
      end
    end

  end
end
