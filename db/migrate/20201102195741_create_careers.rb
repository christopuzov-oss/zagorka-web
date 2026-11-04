class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|

      t.attachment  :cv

      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :email
      t.string :phone
      t.string :position

      t.timestamps
    end
  end
end
