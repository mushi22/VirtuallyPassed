class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :slug, unique: true
      t.integer :gallery
      t.text :image
      t.integer :category
      t.text :description
      t.timestamps
    end
  end
end
