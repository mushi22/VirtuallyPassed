class RemoveEmbedvideoFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :embedvideo, :text
  end
end
