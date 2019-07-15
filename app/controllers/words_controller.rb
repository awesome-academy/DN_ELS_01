class WordsController < ApplicationController
  def index
    @title = t "title.words_index"
    load_words_index
    @courses = Course.name_order
    @courses_name = @courses.map(&:name)
  end

  def load_words_index
    @words = Word.joins(:course)
                 .word_like(params[:key_word], params[:word])
                 .course_like(params[:key_word], params[:course])
                 .paginate(page: params[:page], per_page: Settings.per_page)
                 .name_order
  end
end
