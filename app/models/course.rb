class Course < ApplicationRecord
    belongs_to :user
    has_many :assignments

    validates_presence_of :title, :description 

    def creator 
        @creator = self.user
    end 
end
