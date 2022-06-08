class Comment < ApplicationRecord

  validates :answer, presence: true


  belongs_to :user
  belongs_to :worry
end
