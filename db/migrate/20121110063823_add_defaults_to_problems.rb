class AddDefaultsToProblems < ActiveRecord::Migration
  def change
    change_column :problems, :max_cpu_seconds, :integer, :default => 5
    change_column :problems, :max_total_seconds, :integer, :default => 5
    change_column :problems, :max_megabytes, :integer, :default => 16
  end
end
