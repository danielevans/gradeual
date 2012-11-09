class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.references :user
      t.text :template_code
      t.text :reference_code
      t.decimal :max_cpu_seconds
      t.decimal :max_total_seconds
      t.decimal :max_megabytes

      t.timestamps
    end
  end
end
