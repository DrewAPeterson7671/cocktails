class User < ApplicationRecord
  has_many :cocktails, dependent: :destroy
end
