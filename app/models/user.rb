class User < ActiveRecord::Base
    has_many :courses
    has_many :assignments, through: :courses 
    has_many :completed_assignments, through: :submissions
end
