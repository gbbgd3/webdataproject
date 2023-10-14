class Film < ApplicationRecord
  has_many :films_people
  has_many :people, through: :films_people

  validates :title, presence: true
  validates :release_date, presence: true
  validates :opening_crawl, presence: true
end
