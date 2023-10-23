class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.integer :quantity
      t.references :owner, foreign_key: { to_table: :users }, null: false, index: true

      t.timestamps
    end
  end
end
