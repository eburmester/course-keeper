class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :completed_assignment
end
