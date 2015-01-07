class AddOrderNumberToProofs < ActiveRecord::Migration
  def change
	add_column :proofs, :order_id, :integer
	add_index :proofs, :order_id
  end
end
