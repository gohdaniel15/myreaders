class CreateDiagnostics < ActiveRecord::Migration
  def change
    create_table :diagnostics do |t|
      t.string :type, null: false
      t.references :student, index: true, null: false, foreign_key: true
      t.references :project, index: true, null: false, foreign_key: true
      t.integer :score, null: false, default: 0

      t.timestamps null: false
    end

    add_index :diagnostics, [:student_id, :project_id], unique: true
  end
end
