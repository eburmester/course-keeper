class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  validates_presence_of :content
end
