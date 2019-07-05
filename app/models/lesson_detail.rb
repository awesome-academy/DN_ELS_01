class LessonDetail < ApplicationRecord
  belongs_to :lesson
  belongs_to :question
end
