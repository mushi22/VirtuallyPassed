class AddUserReferenceToExamples < ActiveRecord::Migration
  def change
	add_reference :examples, :user, index: true
  end
end
