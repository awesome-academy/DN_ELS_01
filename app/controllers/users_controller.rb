class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
    @title = t("title.user_show", user_name: @user.name)
    @activities = @user.activities.paginate(page: params[:page],
      per_page: Settings.per_page)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def load_user
    if @user = User.find_by(id: params[:id])
      session[:user_id] = @user.id
    else
      flash[:warning] = t "not_found"
      redirect_to root_url
    end
  end
end
