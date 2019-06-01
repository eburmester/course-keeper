class User < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses 
    has_many :completed_assignments, through: :submissions
    has_secure_password
end
