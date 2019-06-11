class User < ApplicationRecord
  has_many :pets
  has_many :vets, through: :pets
  has_many :reviews, foreign_key: "reviewer_id", class_name: "Review"
  has_many :reviewed_vets, through: :reviews, source: :vet


  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password #password validations
end
