class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def load_more scope
    @activities =
      if params[:last_id]
        @user.send(scope).id_less_than(params[:last_id]).limit(Settings.limit_act)
      else
        @user.send(scope).limit(Settings.limit_act)
      end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
