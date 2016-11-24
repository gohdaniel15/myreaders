class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :project, index: true, foreign_key: true
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
