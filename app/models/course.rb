class Course < ActiveRecord::Base
    belongs_to :user
    has_many :assignments

    def created_by
        
end
