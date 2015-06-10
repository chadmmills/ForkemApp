class CreateMealbooks < ActiveRecord::Migration
  def change
    create_table :mealbooks do |t|

      t.references :user, index: true, foreign_key: true, null: false
      t.string :mealbook_name, null: false
      t.boolean :public, default: false

      t.timestamps null: false
    end
  end
end
