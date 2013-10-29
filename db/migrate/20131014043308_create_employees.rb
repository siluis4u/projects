class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :division

      t.timestamps
    end
  end
end
