class ChangeColumnUserToTeacher < ActiveRecord::Migration
  def up
    rename_column :problems, :user_id, :teacher_id
  end
end
