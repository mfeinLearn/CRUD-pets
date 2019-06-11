class Vet < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  validates :name, :location, :speciality, presence: true
  validates_uniqueness_of :name, scope: :location


  #validates :name, uniqueness: true
  #validates :name, :location, :speciality, presence: true

  def self.most_pets
    joins(:pets).group(:id).order('COUNT(pets.id) DESC').limit(3)
  end



  #validate :duplicate
  # def duplicate
  #   if Vet.find_by(name: name, location: location)
  #     errors.add(:name, "This Vet has already been created")
  #   end
  # end

end
