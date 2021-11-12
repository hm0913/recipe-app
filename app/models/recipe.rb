class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :serving, presence: true
  belongs_to :user
  belongs_to :category
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  has_many :makes, dependent: :destroy
  accepts_nested_attributes_for :makes, allow_destroy: true
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :serving
  has_many :buy_items

  def self.search(keyword)
    if keyword
      Recipe.where('name LIKE ?', "%#{keyword}%")
    else
      Recipe.order("created_at DESC")
    end
  end

  def self.research(serving_id)
    if serving_id >= 5
      Recipe.where("serving_id >= ?", 5)
    else
      Recipe.where(serving_id: serving_id)
    end
  end

end