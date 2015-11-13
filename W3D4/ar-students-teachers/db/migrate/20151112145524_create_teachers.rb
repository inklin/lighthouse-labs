class CreateTeachers < ActiveRecord::Migration

  def change
    drop_table :teachers if ActiveRecord::Base.connection.table_exists?('teachers')
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
    end
  end
end