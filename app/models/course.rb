class Course < ApplicationRecord
    belongs_to :user
    has_many :assignments

    validates_presence_of :title, :description 
end
