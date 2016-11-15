class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :facilitator, index: true, foreign_key: true
      t.string :name, null: false
      t.string :location, null: false
      t.date :start_on, null: false
      t.date :end_on
      t.integer :status, default: 1, null: false

      t.timestamps null: false
    end
  end
end
