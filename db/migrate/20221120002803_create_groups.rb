class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.string :name
      t.text :explain
      t.integer :leader_id

      t.timestamps
    end
  end
end
