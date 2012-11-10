class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :teacher
      t.references :group
      t.references :problem_set
      t.references :problem
      t.datetime :start_at
      t.datetime :due_at
      t.integer :value

      t.timestamps
    end
    add_index :assignments, :teacher_id
    add_index :assignments, :group_id
    add_index :assignments, :problem_set_id
    add_index :assignments, :problem_id
  end
end
