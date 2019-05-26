class Course < ActiveRecord::Base
    belongs_to :user, optional: true 
    has_many :assignments


end
