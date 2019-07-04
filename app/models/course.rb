class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy

  scope :name_order, ->{order("name")}
end
