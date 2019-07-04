class StaticPagesController < ApplicationController
  def home
    @title = t "title.home"
    @user = User.find_by id: session[:user_id]
    return unless @user
    load_more :feed
  end
end
