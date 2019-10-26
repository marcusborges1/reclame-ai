class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.text :description, null: false
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
