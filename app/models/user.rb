class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


has_one_attached :image
has_many :worries
has_many :comments

has_many :loves

validates :nickname, presence: true
validates :email, presence: true
validates :encrypted_password, presence: true


def loved_by?(worry_id)
  Love.where(worry: worry_id).exists?
end
end