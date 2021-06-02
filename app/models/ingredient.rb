class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  belongs_to :recipe
  has_many :buy_items
end
