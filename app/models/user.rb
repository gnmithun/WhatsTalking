class User < ApplicationRecord
  has_many :messages
  has_secure_password

  validates :name, uniqueness: true, presence: true, length: { minimum: 6, maximum: 40 }
  
end