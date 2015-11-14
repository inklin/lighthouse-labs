class AddHireRetireToTeachers < ActiveRecord::Migration

  def change
    add_column :teachers, :hire_date, :date
    add_column :teachers, :retirement_date, :date
  end

end