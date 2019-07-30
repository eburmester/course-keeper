class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :difficulty
  belongs_to :course
  has_many :submissions
end
