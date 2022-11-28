class CreateTagLists < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_lists do |t|

      t.integer :group_id
      t.string :tag_id

      t.timestamps
    end
  end
end
