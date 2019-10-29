class AddTrustRatingToComplaints < ActiveRecord::Migration[6.0]
  def change
    add_column :complaints, :trust_rating, :integer, null: false, default: 0
  end
end
