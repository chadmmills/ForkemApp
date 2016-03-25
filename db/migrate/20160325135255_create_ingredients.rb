class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :meal, index: true, null: false, foreign_key: true, on_cascade: :delete
      t.string :ingredient_name, null: false

      t.timestamps null: false
    end
  end
end
