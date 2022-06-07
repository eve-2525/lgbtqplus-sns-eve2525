class Worry < ApplicationRecord

validates :title, presence: true
validates :problem, presence: true
validates :status, presence: true
validates :situation, presence: true

belongs_to :user
has_many :comments

enum status: { worry: 0, diary: 1 }
enum situation: { published: 0, deleted: 1, Solution: 2 }

end