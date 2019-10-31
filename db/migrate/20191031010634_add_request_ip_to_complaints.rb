class AddRequestIpToComplaints < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :request_ip, :string, null: false
  end
end
