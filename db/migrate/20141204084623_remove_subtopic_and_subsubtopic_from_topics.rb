class RemoveSubtopicAndSubsubtopicFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :subtopic, :string
    remove_column :topics, :subsubtopic, :string
  end
end
