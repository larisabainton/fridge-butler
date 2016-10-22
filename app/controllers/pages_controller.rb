class PagesController < ApplicationController
  def index
    if user_signed_in?
      @get_started_link = fridges_path
      @logo_link = fridges_path
    else
      @get_started_link = new_user_session_path
      @logo_link = root_path
    end
  end

  def show
    if user_signed_in?
      redirect_to fridges_path
    else
      @get_started_link = new_user_session_path
      @logo_link = root_path
      render template: "pages/#{params[:page]}"
    end
  end
end
