class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.string :barcode, null: false
      t.integer :price, null: false
      t.integer :available_quantity, null: false

      t.timestamps
    end
    add_index :items, :name, unique: true
    add_index :items, :barcode, unique: true
  end
end
