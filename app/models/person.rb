class Person < ApplicationRecord
  belongs_to :species
  has_many :films_people
  has_many :films, through: :films_people

  validates :name, presence: true
  validates :birth_year, presence: true
  validates :height, presence: true
  validates :gender, presence: true
  validates :species, presence: true
end
