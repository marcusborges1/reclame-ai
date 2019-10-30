class AddOrderNumberAndDeliveryCepToComplaints < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :order_number, :string, null: false
    add_column :complaints, :delivery_cep, :string, null: false
  end
end
