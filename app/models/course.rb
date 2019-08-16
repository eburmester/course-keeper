class Course < ApplicationRecord
    belongs_to :user
    has_many :assignments

    validates_presence_of :title, :description 

    def creator 
        @creator = self.user
    end 

    def created_on_pretty
        self.created_on.strftime("%B %e, %Y")
    end

  
end
