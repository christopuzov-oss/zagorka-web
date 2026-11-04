class AddTranslationToStaticPages < ActiveRecord::Migration[5.2]
  def change

    reversible do |dir|
      dir.up do
        StaticPage.create_translation_table!({
          title: :string, 
          summary: :string, 
          content: :text
        }, {
          migrate_data: true
        })
      end

      dir.down do
        StaticPage.drop_translation_table! migrate_data: true
      end
    end

  end
end
