class AddStatusToLeaders < ActiveRecord::Migration[5.2]
  def change
    add_column :leaders, :status, :integer, null: false, default: 1
  end
end
