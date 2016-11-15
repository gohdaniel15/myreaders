class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name, null: false
      t.string :class_name, null: false
      t.date :birthday
      t.text :comments

      t.timestamps null: false
    end
  end
end
