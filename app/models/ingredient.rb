class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :recipe
end
