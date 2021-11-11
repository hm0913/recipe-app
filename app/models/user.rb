class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 15}

  mount_uploader :image, ImageUploader
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :troubles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :buy_items
  has_many :answers, dependent: :destroy

  
  def favorited_by?(recipe_id)
    favorites.where(recipe_id: recipe_id).exists?
  end
  
  

  def self.guest
    find_or_create_by!(email: "test@com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  

  def checked_by?(ingredient_id)
    buy_items.where(ingredient_id: ingredient_id).exists?
  end

  def examined_by?(recipe_id)
    buy_items.where(recipe_id: recipe_id).exists?
  end

  

end