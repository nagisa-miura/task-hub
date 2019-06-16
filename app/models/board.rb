class Board < ApplicationRecord
  belongs_to :user
  has_many   :lists, dependent: :destroy  
  validates  :title, length: { in: 1..255 }
  
end
