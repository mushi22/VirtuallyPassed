class CreateSubsubtopics < ActiveRecord::Migration
  def change
    create_table :subsubtopics do |t|
      t.string :title
      t.text :description
      t.references :Subtopic, index: true

      t.timestamps
    end
  end
end
