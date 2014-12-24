class AddVideoLinkToSubtopics < ActiveRecord::Migration
  def change
    add_column :subtopics, :video_link, :string
  end
end
