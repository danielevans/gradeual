class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :teacher
      t.string :name
      t.string :description
      t.string :tags

      t.timestamps
    end
    add_index :groups, :teacher_id
  end
end
