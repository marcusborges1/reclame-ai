class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :order_number, null: false
      t.integer :total_value, null: false

      t.timestamps
    end
    add_index :sales, :order_number, unique: true
  end
end
