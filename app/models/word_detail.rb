class WordDetail < ApplicationRecord
  belongs_to :user
  belongs_to :word

  scope :favorite, ->{where is_favorite: true}
  scope :learned, ->{where is_learned: true}
end
