class Question < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  has_many :lesson_details, dependent: :destroy
end
