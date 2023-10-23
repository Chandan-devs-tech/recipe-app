class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :description
      t.boolean :public
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
