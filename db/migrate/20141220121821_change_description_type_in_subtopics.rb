class ChangeDescriptionTypeInSubtopics < ActiveRecord::Migration
  def change
  change_column :subtopics, :description, :text, :limit => nil
  end
end
