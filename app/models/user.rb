class User < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses 
    has_many :completed_assignments, through: :assignments, :source => "assignment"
    has_secure_password

    validates_presence_of :email
end
