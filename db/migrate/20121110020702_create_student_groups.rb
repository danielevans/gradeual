class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.references :student
      t.references :group

      t.timestamps
    end
    add_index :student_groups, :student_id
    add_index :student_groups, :group_id
  end
end
