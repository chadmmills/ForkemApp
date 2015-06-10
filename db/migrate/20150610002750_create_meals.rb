class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|

      t.references :mealbook, index: true, foreign_key: true, null: false

      t.string :meal_title, null: false
      t.text :meal_notes, default: ""

      t.integer :weekday, default: 0
      t.integer :meal_type, default: 0
      
      t.timestamps null: false
    end
  end
end
