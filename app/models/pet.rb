class Pet < ApplicationRecord
  validates :name, :species, presence: true

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
