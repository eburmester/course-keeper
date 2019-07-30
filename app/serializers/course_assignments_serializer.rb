class CourseAssignmentsSerializer < ActiveModel::Serializer
  attributes :id, :title, :course_id, :user_id
  has_many :submissions
end
