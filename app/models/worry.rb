class Worry < ApplicationRecord

validates :title, presence: true
validates :problem, presence: true
validates :status, presence: true
validates :situation, presence: true
validates :encrypted_password, presence: true


enum status: { worry: 0, diary: 1 }
enum situation: { public: 0, Solution: 1, private: 2, draft: 3 }

end
