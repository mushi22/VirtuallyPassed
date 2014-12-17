class AddCourseReferenceToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :course, index: true
  end
end
