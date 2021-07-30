class User < ApplicationRecord
  has_many :cocktails, dependent: :destroy
  validates :username, presence: true
end
