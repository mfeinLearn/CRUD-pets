class Pet < ApplicationRecord
  validates :name, :species, presence: true
  validates :name, length: { minimum: 3,
    too_long: "%{count} characters is the minimum allowed" }

  belongs_to :user
  # pet.user - it has a writer and reader of just user
  belongs_to :vet#, optional: true

  #accepts_nested_attributes_for :vet

  # belongs to where you dont want dupplicates - it is best to
  # create a custome one
  def vet_attributes=(attributes)
    vet = Vet.find_or_create_by(attributes)
    self.vet = vet if vet.valid? || !self.vet
  end



  scope :order_by_age, -> {order(:age)}
  scope :order_by_animals, -> {where("age > ?",7)}
  scope :dogs, -> {where(species: "Dog")}
  scope :cats, -> {where(species: "Cat")}
  scope :fish, -> {where(species: "Fish")}
  scope :search_by_age, -> (search_age){where("age = ?", search_age)}

  # def self.order_by_age
  #   order(:age)
  # end
end
