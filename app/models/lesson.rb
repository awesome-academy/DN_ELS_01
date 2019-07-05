class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :lesson_details, dependent: :destroy
  has_many :questions, through: :lesson_details
end
