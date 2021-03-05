class Make < ApplicationRecord
  validates :order, presence: true
  validates :sentence, presence: true
  belongs_to :recipe
  belongs_to :order
  
end
