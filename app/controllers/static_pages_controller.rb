class StaticPagesController < ApplicationController
  def home
    @title = t "title.home"
    @user = User.find_by id: session[:user_id]
    return unless @user
    @activities = @user.feed.paginate(page: params[:page],
      per_page: Settings.per_page)
  end
end
