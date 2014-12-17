class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :maintopic
      t.string :subtopic
      t.string :subsubtopic
      t.text :description
      t.text :embedvideo

      t.timestamps
    end
  end
end
