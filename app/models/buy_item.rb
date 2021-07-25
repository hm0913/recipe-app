class BuyItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :user
  validates :ingredient_id, uniqueness: {scope: [:user_id, :recipe_id]}
end
