class PagesController < ApplicationController

  def index

  end

  def create
    # render plain: params[:main_form].inspect
    @user_id = params.require(:main_form)[:user_id]
  end

end
