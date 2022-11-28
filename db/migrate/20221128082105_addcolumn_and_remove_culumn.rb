class AddcolumnAndRemoveCulumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :group_id, :integer
  end
end
