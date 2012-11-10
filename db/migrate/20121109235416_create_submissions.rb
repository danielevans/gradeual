class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :student
      t.references :assignment

      t.timestamps
    end
  end
end
