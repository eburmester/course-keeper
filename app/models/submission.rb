class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  validates_presence_of :content

  def self.by_user(user)
    self.where(user_id: user.id)
  end
end
