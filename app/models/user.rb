class User < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses 
    has_many :submissions
    has_many :completed_assignments, through: :submissions, :source => "assignment"
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email  
end
