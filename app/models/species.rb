class Species < ApplicationRecord
  has_many :people

  validates :name, presence: true, uniqueness: true
end
