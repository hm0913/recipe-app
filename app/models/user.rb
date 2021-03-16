class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  mount_uploader :image, ImageUploader
  has_many :recipes
  has_many :favorites, dependent: :destroy
  def favorited_by?(recipe_id)
    favorites.where(recipe_id: recipe_id).exists?
  end
  has_many :comments, dependent: :destroy
end