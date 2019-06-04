class Assignment < ApplicationRecord
    belongs_to :course
    has_many :submissions
    has_many :users, through: :submissions

    validates_presence_of :title, :difficulty

    def creator 
        @creator = self.course.user
    end 
    
    def self.easy
        where(difficulty: 'easy')
    end 
    
    def self.medium
        where(difficulty: 'medium')
    end
    
    def self.hard
        where(difficulty: 'hard')
    end 
end
