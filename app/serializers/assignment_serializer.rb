class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :difficulty
  belongs_to :course
end
