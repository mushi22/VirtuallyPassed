class AddTopicRefToSubtopics < ActiveRecord::Migration
  def change
    add_reference :subtopics, :topic, index: true
  end
end
