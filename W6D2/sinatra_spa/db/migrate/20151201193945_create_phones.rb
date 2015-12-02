class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string  :context
      t.string  :digits
      t.integer :contact_id
    end
  end
end
