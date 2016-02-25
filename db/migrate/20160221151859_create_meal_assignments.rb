class CreateMealAssignments < ActiveRecord::Migration
  def change
    create_table :meal_assignments do |t|
      t.date :assigned_on, null: false
      t.references :meal, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
