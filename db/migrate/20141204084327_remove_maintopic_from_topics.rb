class RemoveMaintopicFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :maintopic, :string
  end
end
