class Worry < ApplicationRecord

validates :title, presence: true
validates :problem, presence: true
validates :status, presence: true
validates :encrypted_password, presence: true
end
