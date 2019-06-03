class Assignment < ApplicationRecord
    belongs_to :course
    has_many :submissions
    has_many :users, through: :submissions

    validates_presence_of :title, :difficulty
end
