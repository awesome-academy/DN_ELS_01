class Word < ApplicationRecord
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :word_details, dependent: :destroy
end
