class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :image, presence: true
  belongs_to :user
  belongs_to :category
end
