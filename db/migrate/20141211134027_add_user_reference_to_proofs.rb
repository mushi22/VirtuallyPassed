class AddUserReferenceToProofs < ActiveRecord::Migration
  def change
	add_reference :proofs, :user, index: true
  end
end
