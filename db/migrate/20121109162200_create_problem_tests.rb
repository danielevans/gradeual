class CreateProblemTests < ActiveRecord::Migration
  def change
    create_table :problem_tests do |t|
      t.references :problem
      t.text :driver
      t.text :expected_result
      t.boolean :show_result

      t.timestamps
    end
  end
end
