class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :session, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.boolean :presence, null: false, default: false

      t.timestamps null: false
    end
  end
end
