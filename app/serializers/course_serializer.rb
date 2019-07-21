class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :assignments, serializer: CourseAssignmentsSerializer
end
