class Word < ApplicationRecord
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :word_details, dependent: :destroy

  scope :word_like,
    (lambda do |params, conditional|
      where("words.name LIKE ?", "%#{params}%") if conditional.present?
    end)
  scope :course_like,
    (lambda do |params, conditional|
      where("courses.name LIKE ?", "%#{params}%") if conditional.present?
    end)
  scope :name_order, ->{order("name")}
end
