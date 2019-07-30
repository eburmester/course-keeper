class ShowCourseSerializer < ActiveModel::Serializer
  attributes :id, :assignments, :description, :created_on_pretty, :created_by
  has_many :assignments
end
