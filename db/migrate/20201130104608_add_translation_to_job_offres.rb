class AddTranslationToJobOffres < ActiveRecord::Migration[5.2]
  def change
    
    reversible do |dir|
      dir.up do
        JobOffer.create_translation_table!({
          post: :string, 
          location: :string, 
          job_type: :string
        }, {
          migrate_data: true
        }) 
      end

      dir.down do
        JobOffer.drop_translation_table! migrate_data: true
      end
    end

  end
end
