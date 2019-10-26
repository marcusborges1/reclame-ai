class CreateSubSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_sales do |t|
      t.references :item, null: false, foreign_key: true
      t.references :sale, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :subtotal, null: false

      t.timestamps
    end
  end
end
