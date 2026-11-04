class AddTranslationToLeaders < ActiveRecord::Migration[5.2]
  def change
    
    reversible do |dir|
      dir.up do
        Leader.create_translation_table!({
          name: :string, 
          post: :string, 
          content: :text
        }, {
          migrate_data: true
        })
      end

      dir.down do
        Leader.drop_translation_table! migrate_data: true
      end
    end

  end
end
