class AddOrderNumberToExamples < ActiveRecord::Migration
  def change
	add_column :examples, :order_id, :integer
	add_index :examples, :order_id
  end
end
