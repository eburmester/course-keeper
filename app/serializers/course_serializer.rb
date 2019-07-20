class CourseSerializer < ActiveModel::Serializer
  attributes :title, :description
  has_many :assignments, serializer: AssignmentsSerializer
end
