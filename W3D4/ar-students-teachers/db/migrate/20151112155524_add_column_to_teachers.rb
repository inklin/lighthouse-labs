class AddColumnToTeachers < ActiveRecord::Migration

  def change
    add_column :teachers, :last_student_added_at, :date
  end

end