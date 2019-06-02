class User < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses 
    has_many :submissions, through: :assignments
    has_secure_password
end
