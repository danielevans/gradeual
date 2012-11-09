class CreateProblemSets < ActiveRecord::Migration
  def change
    create_table :problem_sets do |t|
      t.references :group
      t.datetime :start_at
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :problem_sets, :group_id
  end
end
