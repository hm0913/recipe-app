class Trouble < ApplicationRecord
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true
  belongs_to :user
  has_many :answers, dependent: :destroy
end